#!/usr/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

require 'pp'
require 'date'
require 'json'
require 'ostruct'

# OhMyCodeReview reminder
#
# Run in a directory with Phabricator config:
#
#   ~/dotfiles/scripts/git-code-review.rb config.json
#
# Sample configs:
#
#   {
#       "slack_hook": "...",
#       "repo": "$GOPATH/src/...",
#       "diff_url": "...",
#       "groups": [
#           {
#               "query": "phab-query-url",
#               "channel": "slack-channel"
#           }
#       ]
#   }
#
# Dependencies:
#
#   brew install httpie
#

# Load config
def load_config(path)
  cfg = JSON.parse(File.read(path))
  OpenStruct.new(cfg)
end

BLAME = /.+? +\((.+?) +(\d{4}-\d\d-\d\d \d\d:\d\d:\d\d [\-\+]\d{4}) +\d+\) .*/

def git_blame(repo, file)
  content = `git blame #{repo}#{file}`
  return {} if content.empty?

  modified_by = {}
  content.split("\n").each do |l|
    m = BLAME.match(l)
    pp l && next if m.nil?

    name, date = m[1], DateTime.parse(m[2])
    modified = modified_by[name] || {count: 0, last_edit_at: DateTime.new(0)}
    modified[:count] += 1
    modified[:last_edit_at] = [date, modified[:last_edit_at]].max
    modified_by[name] = modified
  end
  modified_by
end

def slack(hook, channel, msg)
  payload = {
    channel: channel,
    username: 'OhMyCodeReview',
    icon_emoji: ':face_with_monocle:',
    text: msg
  }

  pp `echo '#{JSON.generate(payload)}' | http POST #{hook} content-type:application/json`
end

def conduit(api, payload)
  resp = JSON.parse(`echo '#{JSON.generate(payload)}' | arc call-conduit #{api}`)
  resp['response']
end

def revision_search(query_key)
  resp = conduit('differential.revision.search', queryKey: query_key)
  resp['data'].map { |d| OpenStruct.new(d) }
end

def user_search(phid)
  resp = conduit('user.search', constraints: { phids: Array(phid) })
  OpenStruct.new(resp['data'][0])
end

def commit_msg(revid)
  begin
    resp = conduit('differential.getcommitmessage', revision_id: revid)

    title, rest = resp.split("\n\nSummary:\n")
    if rest.nil? # no summary
      title, rest = resp.split("\n\nReviewers:")
    else
      summary, rest = rest.split("\n\nReviewers:")
    end

    reviewers, rest = rest.split("\n\nReviewed By:")
    if rest.nil?
      reviewed_by = '' # no reviewed_by
      reviewers, rest = reviewers.split(/\n\nSubscribers:|\n\nDifferential Revision:/)
      subscribers, revision = rest.split("\n\nDifferential Revision:") unless rest.nil?
    else
      reviewed_by, rest = rest.split(/\n\nSubscribers:|\n\nDifferential Revision:/)
      subscribers, revision = rest.split("\n\nDifferential Revision:") unless rest.nil?
    end
  rescue Exception => e
    pp e
  end

  commit = {
    title: title.to_s.strip,
    summary: summary.to_s.strip,
    reviewers: reviewers.to_s.strip.split(', '),
    reviewed_by: reviewed_by.to_s.strip.split(', '),
    subscribers: subscribers.to_s.strip.split(', '),
    revision: revision.to_s.strip
  }

  OpenStruct.new(commit)
end

def commit_paths(revid)
  conduit('differential.getcommitpaths', revision_id: revid)
end

def time_ago(unix_t)
  elapsed = Time.now - Time.at(unix_t)

  case
  when elapsed >= 172_800
    '%d days' % [elapsed / 86_400]
  when elapsed >= 86_400
    '%d day' % [elapsed / 86_400]
  when elapsed >= 7200
    '%d hrs' % [elapsed / 3600]
  when elapsed >= 3600
    '%d hr' % [elapsed / 3600]
  when elapsed >= 120
    '%d mins' % [elapsed / 60]
  else
    '%d min' % [elapsed / 60]
  end
end

def levenshtein_distance(s, t)
  m = s.length
  n = t.length
  return m if n == 0
  return n if m == 0
  d = Array.new(m+1) {Array.new(n+1)}

  (0..m).each {|i| d[i][0] = i}
  (0..n).each {|j| d[0][j] = j}
  (1..n).each do |j|
    (1..m).each do |i|
      d[i][j] = if s[i-1] == t[j-1]  # adjust index into string
                  d[i-1][j-1]       # no operation required
                else
                  [ d[i-1][j]+1,    # deletion
                    d[i][j-1]+1,    # insertion
                    d[i-1][j-1]+1,  # substitution
                  ].min
                end
    end
  end
  d[m][n]
end

USERS = Hash.new { |hash, phid| hash[phid] = user_search(phid) }

def scan_diffs(cfg)
  cfg.groups.each do |group|
    revs = revision_search(group['query'])
    authors = []
    revs = revs.map do |rev|
      commit = commit_msg(rev.id)
      paths = commit_paths(rev.id)

      reviewers = commit.reviewers - commit.reviewed_by
      reviewers = reviewers.reject { |r| r.start_with?('#') }
      if reviewers.empty?
        modified_by = {}
        paths.sample(9).each do |path|
          git_blame(cfg.repo || Dir.pwd, path).each_pair do |name, v|
            m = modified_by[name]

            if m.nil?
              m = v
            else
              m[:count] += v[:count]
              m[:last_edit_at] = [v[:last_edit_at], m[:last_edit_at]].max
            end

            modified_by[name] = m
          end
        end
        reviewers = modified_by.sort_by { |n, v| -v[:count] }.map { |n| n[0] }
      end

      author = USERS[rev.fields['authorPHID']]
      authors << author.fields['username']

      OpenStruct.new({ revision: rev,
                       author: author,
                       commit: commit,
                       paths: paths,
                       reviewers: reviewers })
    end

    msgs = revs.map do |rev|
      pp rev.revision
      pp rev.author
      pp rev.reviewers

      msg  = "*#{rev.author.fields['username']}* "
      msg += "<#{cfg.diff_url}#{rev.revision.id}|#{rev.revision.fields['title'].gsub(/[<>"'\\\/]/, '')}> "

      reviewer = rev.reviewers[0].to_s
      # exclude self
      if levenshtein_distance(reviewer.upcase, rev.author.fields['username'].upcase) <= 5
        reviewer = rev.reviewers[1]
      end
      # random pick
      if reviewer.nil? || reviewer.empty?
        reviewer = (authors - [rev.author.fields['username']]).sample
      end
      # unless we still don’t have reviewer
      msg += "\n    Ping *#{reviewer}* " unless reviewer.nil?

      msg += "(_#{time_ago(rev.revision.fields['dateModified'])}_)"
      msg
    end

    if msgs.empty?
      msg = [
        "Aiyoh, nothing to review. Make more diffs lah :diya:",
        "Sial ah, everything has been reviewed :really_good_job:",
      ].sample

      slack(cfg.slack_hook, group['channel'], ":hourglass: *Code Review:*\n" + msg)
    else
      while !msgs.empty?
        msg = ''
        msg += "\n" + msgs.shift.to_s while !msgs.empty? && (msg.length + msgs.first.to_s.length < 3000)

        slack(cfg.slack_hook, group['channel'], ":hourglass: *Code Review:*" + msg)
        sleep(1) # breath
      end
    end
  end
end

if ARGV.length != 1
  abort "Usage: #{$PROGRAM_NAME} config.json"
end

CONFIG_PATH = ARGV[0]

loop do
  begin
    cfg = load_config(CONFIG_PATH)
    scan_diffs(cfg)
  rescue Exception => e
    pp e
  end

  sleep(1740) # 29 mins
end
