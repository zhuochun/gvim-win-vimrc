" AndrewRadev bundles {{{
" diff two blocks of code {{
NeoBundleLazy 'AndrewRadev/linediff.vim', {
      \   'autoload' : { 'commands' : ['Linediff', 'LinediffReset'] }
      \ }
" }}

" powerful split and join {{
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
      \   'autoload' : {
      \     'mappings' : ['gS', 'gJ'],
      \     'commands' : ['SplitjoinJoin', 'SplitjoinSplit']
      \   }
      \ }
" }}

" switch between words {{
NeoBundleLazy 'AndrewRadev/switch.vim', {
      \   'autoload' : { 'commands': ['Switch'] },
      \ }
" }}

" grep and update {{
NeoBundleLazy 'AndrewRadev/writable_search.vim', {
      \   'autoload' : { 'commands': ['WritableSearch'] },
      \ }
" }}
" }}}

" math calculation in vim {{{
NeoBundleLazy 'arecarn/selection.vim'
NeoBundleLazy 'arecarn/crunch.vim', {
      \   'depends' : 'arecarn/selection.vim',
      \   'autoload' : {
      \     'mappings' : ['g=', 'g=='],
      \     'commands' : ['Crunch'],
      \   }
      \ }
" }}}

" CamelCaseMotion in W, B, E {{{
NeoBundleLazy 'bkad/CamelCaseMotion', {
      \   'autoload' : { 'mappings' : ['<Plug>CamelCaseMotion'] },
      \ }
" }}}

" buffers {{{
NeoBundleLazy 'mhinz/vim-sayonara', {
      \   'autoload' : { 'commands' : ['Sayonara'] },
      \ }

NeoBundleLazy 'schickling/vim-bufonly', {
      \   'autoload' : { 'commands' : ['BufOnly', 'BOnly'] },
      \ }
" }}}

" NrrwRgn {{{
NeoBundleLazy 'chrisbra/NrrwRgn', {
      \   'autoload' : { 'commands' : ['NarrowRegion', 'NRPrepare', 'NRMulti'] },
      \ }
" }}}

" Enhanced Vimdiff {{{
NeoBundleLazy 'chrisbra/vim-diff-enhanced', {
      \   'autoload' : { 'commands' : ['EnhancedDiff', 'PatienceDiff'], },
      \ }
" }}}

" rest-console {{{
" set filetypes=rest, then use <C-j> to trigger request
NeoBundleLazy 'diepm/vim-rest-console', {
      \   'autoload' : { 'filetypes' : ['rest'] },
      \ }
" }}}

" highlight phrases {{{
NeoBundleLazy 'dimasg/vim-mark', {
      \   'autoload' : {
      \     'commands' : ['Mark', 'MarkLoad', 'MarkClear'],
      \     'mappings' : ['<Plug>IgnoreMark', '<Plug>Mark', ','],
      \   },
      \ }
" }}}

" sequencial numbering with pattern {{{
" :[range]RengBang [pattern] [start] [step] [usefirst] [format] *RengBang*
NeoBundleLazy 'deris/vim-rengbang', {
      \   'autoload' : {
      \     'commands' : ['RengBang', 'RengBangUsePrev', 'RengBangConfirm'],
      \     'mappings' : ['<Plug>(operator-rengbang'],
      \   },
      \ }
" }}}

" easymotion {{{
NeoBundleLazy 'easymotion/vim-easymotion', {
      \   'autoload' : { 'mappings' : ['<Plug>(easymotion-'] },
      \ }
" }}}

" wrap and unwrap function arguments, lists, and dictionaries {{{
NeoBundleLazy 'FooSoft/vim-argwrap', {
      \   'autoload' : { 'commands' : ['ArgWrap'] },
      \ }
" }}}

" vim-asterisk: * and # to search selection {{{
NeoBundleLazy 'haya14busa/vim-asterisk', {
      \   'autoload' : { 'mappings' : ['<Plug>(asterisk-'], },
      \ }
" }}}

" incsearch.vim {{{
NeoBundleLazy 'haya14busa/incsearch.vim', {
      \   'autoload' : { 'mappings' : ['<Plug>(incsearch-'], },
      \ }

NeoBundleLazy 'haya14busa/incsearch-fuzzy.vim', {
      \   'depends'  : ['haya14busa/incsearch.vim'],
      \   'autoload' : { 'mappings' : ['<Plug>(incsearch-fuzzy-'], },
      \ }
" }}}

" semantic-highlight {{{
NeoBundleLazy 'jaxbot/semantic-highlight.vim', {
      \   'autoload' : {
      \     'commands' : ['SemanticHighlight'],
      \     'filetypes': ['ruby', 'coffee', 'elixir', 'go'],
      \   },
      \ }
" }}}

" trigger tests {{{
NeoBundleLazy 'janko-m/vim-test', {
      \   'depends' : ['tpope/vim-dispatch'],
      \   'autoload' : {
      \      'commands' : ['TestLast', 'TestNearest', 'TestFile', 'TestSuite'],
      \   },
      \ }
" }}}

" auto-pairs {{{
NeoBundle 'jiangmiao/auto-pairs'
" }}}

" vim-easy-align {{{
NeoBundleLazy 'junegunn/vim-easy-align', {
      \   'autoload' : { 'mappings' : ['<Plug>(EasyAlign)'] },
      \ }
" }}}

" rainbow_parentheses {{{
NeoBundleLazy 'junegunn/rainbow_parentheses.vim', {
      \   'autoload' : { 'commands' : ['RainbowParentheses'] },
      \ }
" }}}

" improve blockwise visual mode {{{
NeoBundleLazy 'kana/vim-niceblock', {
      \   'autoload' : { 'mappings' : ['<Plug>(niceblock', 'v'] }
      \ }
" }}}

" custom operator {{{
NeoBundleLazy 'kana/vim-operator-user'
" }}}

" open documentation {{{
NeoBundleLazy 'keith/investigate.vim', {
      \   'autoload' : { 'mappings' : ['gK'] },
      \ }
" }}}

" faster updating folds {{{
NeoBundle 'Konfekt/FastFold'
" }}}
"
" Yank ring {{{
NeoBundle 'LeafCage/yankround.vim', {
      \   'depends' : ['Shougo/unite.vim'],
      \ }
" }}}

" mattn packages {{{
" Web API plugin for other plugins
NeoBundleLazy 'mattn/webapi-vim'

" GitHub gist in vim {{
NeoBundleLazy 'mattn/gist-vim', {
      \   'depends'  : ['mattn/webapi-vim', 'mattn/unite-gist'],
      \   'autoload' : {'commands': ['Gist']},
      \ }

NeoBundleLazy 'mattn/unite-gist', {
      \   'depends' : ['mattn/gist-vim', 'Shougo/unite.vim'],
      \ }
" }}
" }}}

" Tagbar {{{
NeoBundleLazy 'majutsushi/tagbar', {
      \   'autoload' : { 'commands' : ['TagbarToggle'] },
      \ }
" }}}

" match open/close {{{
NeoBundle 'matchit.zip'
" }}}

" undotree {{{
NeoBundleLazy 'mbbill/undotree', {
      \   'autoload' : { 'commands': ['UndotreeToggle'] },
      \ }
" }}}

" osyo-manga bundles {{{
NeoBundleLazy 'osyo-manga/vim-anzu', {
      \   'depends' : ['Shougo/unite.vim'],
      \   'autoload': { 'mappings' : ['<Plug>(anzu-', 'n'] },
      \ }

NeoBundleLazy 'osyo-manga/vim-over', {
      \   'autoload' : { 'commands' : ['OverCommandLine'] },
      \ }

NeoBundleLazy 'osyo-manga/vim-brightest', {
      \   'autoload' : {
      \     'commands' : ['BrightestEnable'],
      \     'filetypes': ['go'],
      \   }
      \ }
" }}}

" Syntastic {{{
NeoBundleLazy 'vim-syntastic/syntastic', {
      \   'autoload' : { 'focus' : 1 },
      \ }
" }}}

" NERDTree {{{
NeoBundle 'scrooloose/nerdtree', {
      \   'autoload' : {
      \     'explorer' : 1,
      \     'mappings' : ['NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'],
      \   }
      \ }
" }}}

" Shougo bundles {{{
NeoBundleLazy 'Shougo/context_filetype.vim', {
      \   'autoload' : {
      \     'function_prefix' : 'context_filetype'
      \   }
      \ }

" Async execution library {{
NeoBundleLazy 'Shougo/vimproc.vim', {
      \   'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \   }
      \ }
" }}

NeoBundleLazy 'Shougo/neoinclude.vim'

NeoBundleLazy 'Shougo/echodoc', {
      \   'autoload': { 'insert': 1, },
      \ }
" }}

" Unite {{
NeoBundle 'Shougo/unite.vim', {
      \   'depends' : ['Shougo/vimproc.vim'],
      \ }

NeoBundle 'Shougo/neomru.vim', {
      \   'depends' : ['Shougo/unite.vim'],
      \ }

NeoBundle 'Shougo/unite-outline', {
      \   'depends' : ['Shougo/unite.vim'],
      \ }

NeoBundle 'Shougo/junkfile.vim', {
      \   'depends' : ['Shougo/unite.vim'],
      \ }

NeoBundleLazy 'Shougo/unite-session', {
      \   'depends' : ['Shougo/unite.vim'],
      \   'autoload': {'mappings': ['UniteSessionSave', 'UniteSessionLoad']},
      \ }

NeoBundleLazy 'kopischke/unite-spell-suggest', {
      \   'depends' : ['Shougo/unite.vim'],
      \   'autoload': {'autoload':{'filetypes': ['markdown']}},
      \ }

NeoBundleLazy 'ujihisa/unite-colorscheme', {
      \   'depends' : ['Shougo/unite.vim'],
      \   'autoload': {'insert': 1},
      \ }

NeoBundleLazy 'osyo-manga/unite-quickfix', {
      \   'depends' : ['Shougo/unite.vim'],
      \   'autoload': {'insert': 1},
      \ }

NeoBundleLazy 'tacroe/unite-mark', {
      \   'depends' : ['Shougo/unite.vim'],
      \   'autoload': {'insert': 1},
      \ }

NeoBundleLazy 'tsukkee/unite-tag', {
      \   'depends' : ['Shougo/unite.vim', 'Shougo/neoinclude.vim'],
      \   'autoload': {'insert': 1},
      \ }

NeoBundleLazy 'moznion/unite-git-conflict.vim', {
      \   'depends' : ['Shougo/unite.vim'],
      \   'autoload': { 'explorer' : 1 }
      \ }
" }}

" VimShell {{
NeoBundleLazy 'Shougo/vimshell.vim', {
      \   'depends' : 'Shougo/vimproc.vim',
      \   'autoload' : {
      \     'commands' : ['VimShellPop', 'VimShellTab', 'VimShell', 'VimShellInteractive'],
      \     'mappings' : ['<Plug>(vimshell_'],
      \   },
      \ }
" }}

" NeoComplete {{
NeoBundleLazy 'Shougo/neocomplete.vim', {
      \   'depends'  : ['Shougo/vimproc.vim', 'Shougo/context_filetype.vim', 'Shougo/neoinclude.vim'],
      \   'autoload' : {'insert': 1},
      \   'disabled' : (!has('lua') || has('nvim'))
      \ }

" Complete words in English
NeoBundleLazy 'ujihisa/neco-look', {
      \   'depends'  : ['Shougo/neocomplete.vim'],
      \   'autoload' : {'insert': 1}
      \ }

" Complete with syntax source
NeoBundleLazy 'Shougo/neco-syntax', {
      \   'depends'  : ['Shougo/neocomplete.vim'],
      \   'autoload' : {'insert': 1}
      \ }

" Complete vimscript
NeoBundleLazy 'Shougo/neco-vim', {
      \   'depends'  : ['Shougo/neocomplete.vim'],
      \   'autoload' : {'filetypes': 'vim'}
      \ }

" Complete Ruby with rcodetools
NeoBundleFetch 'osyo-manga/vim-monster', {
      \   'depends'  : ['Shougo/vimproc.vim', 'Shougo/neocomplete.vim'],
      \   'autoload' : {'filetypes': 'ruby'}
      \ }
" }}

" NeoSnippet {{
NeoBundleLazy 'Shougo/neosnippet.vim', {
      \   'depends'  : ['Shougo/neocomplete.vim', 'Shougo/context_filetype.vim'],
      \   'autoload' : {
      \     'insert': 1,
      \     'filetypes' : ['snippet', 'neosnippet'],
      \   }
      \ }

NeoBundleFetch 'zhuochun/vim-snippets'
NeoBundleFetch 'zhuochun/vim-dicts'
" }}
" }}}

" Git conflict marker {{{
" nmap <buffer>]x <Plug>(conflict-marker-next-hunk)
" nmap <buffer>[x <Plug>(conflict-marker-prev-hunk)
" nmap <buffer>ct <Plug>(conflict-marker-themselves)
" nmap <buffer>co <Plug>(conflict-marker-ourselves)
" nmap <buffer>cn <Plug>(conflict-marker-none)
" nmap <buffer>cb <Plug>(conflict-marker-both)
NeoBundleLazy 'rhysd/conflict-marker.vim', {
      \   'autoload' : { 'mappings' : ['[x', ']x', '<Plug>(conflict-marker'] }
      \ }
" }}}

" window operations {{{
NeoBundleLazy 't9md/vim-choosewin', {
      \   'autoload' : {
      \     'commands' : ['ChooseWin'],
      \     'mappings' : ['<Plug>(choosewin)'],
      \   }
      \ }
" }}}

" multiple cursors {{{
NeoBundleLazy 'terryma/vim-multiple-cursors', {
      \   'autoload' : { 'mappings' : ['<C-n>'] }
      \ }
" }}}

" vim-exchange {{{
" cx{motion}, cxx (current line), cxc (clear), X (visual exchange)
NeoBundleLazy 'tommcdo/vim-exchange', {
      \   'autoload' : {
      \     'mappings' : ['cx', 'cxx', 'X', '<Plug>(Exchange'],
      \   }
      \ }
" }}}

" tpope bundles {{{
" MixedCase (crm), camelCase (crc) snake_case (crs), UPPER_CASE (cru)
NeoBundleLazy 'tpope/vim-abolish', {
      \   'autoload' : {
      \     'mappings' : ['crm', 'crc', 'crs', 'cru'],
      \     'commands' : ['Abolish']
      \   }
      \ }

" Comments (gcc), Uncomment (gcu), Toggle visual block (gc)
NeoBundleLazy 'tpope/vim-commentary', {
      \   'autoload' : {'mappings' : ['gc', 'gcc', 'gcu']}
      \ }

NeoBundleLazy 'tpope/vim-characterize', {
      \   'autoload' : {'mappings' : ['ga']}
      \ }

NeoBundleLazy 'tpope/vim-dispatch', {
      \   'autoload' : { 'commands' : ['Dispatch'] },
      \ }

NeoBundleLazy 'tpope/vim-eunuch', {
      \   'autoload' : {
      \     'commands' : [
      \       'Unlink', 'Remove', 'Move', 'Rename', 'Chmod',
      \       'Mkdir', 'Find', 'Wall', 'W', 'SudoWrite', 'SudoEdit'
      \     ]
      \   },
      \ }

NeoBundleLazy 'tpope/vim-projectionist', {
      \   'autoload' : { 'explorer' : 1 }
      \ }

NeoBundle 'tpope/vim-repeat'

" ds'    : 'word'      -> word
" dst    : <a>word</a> -> word
" cs'[   : 'word'      -> [word]
" cst<a> : <p>word</p> -> <a>word</a>
" viwS'  : word        -> 'word'
" viwS<p>: word        -> <p>word</p>
" ysiw'  : word        -> 'word'
" ysiw<p>: word        -> <p>word</p>
" yss for entire line
NeoBundle 'tpope/vim-surround'

NeoBundleLazy 'tpope/vim-scriptease', {
      \   'autoload' : { 'commands' : ['PP', 'Runtime', 'Disarm', 'Verbose'] },
      \ }

" bprevious: [b, bnext: ]b, bfirst: [B
" lprevious: [l, lnext: ]l, lfirst: [L
" cprevious: [q, cnext: ]q, cfirst: [Q
" tprevious: [t, tnext: ]t
" prev hunk: [n, nhunk: ]n
NeoBundleLazy 'tpope/vim-unimpaired', {
      \   'autoload' : { 'mappings' : ['[', ']'] }
      \ }

NeoBundleLazy 'tpope/vim-vinegar', {
      \   'depends'  : ['scrooloose/nerdtree'],
      \   'autoload' : {'mappings' : ['-']}
      \ }

NeoBundleLazy 'tpope/vim-endwise', {
      \   'autoload' : {'insert': 1}
      \ }
" }}}

" text replacement in quickfix {{{
NeoBundleLazy 'thinca/vim-qfreplace', {
      \   'autoload' : {
      \     'commands'  : ['Qfreplace'],
      \     'filetypes' : ['unite', 'quickfix'],
      \   }
      \ }
" }}}

" open-browser.vim {{{
NeoBundleLazy 'tyru/open-browser.vim', {
      \   'autoload' : {
      \     'commands' : ['OpenBrowser', 'OpenBrowserSearch', 'OpenBrowserSmartSearch'],
      \     'mappings' : '<Plug>(openbrowser-',
      \   }
      \ }

" opens GitHub URL of current file
NeoBundleLazy 'tyru/open-browser-github.vim', {
      \   'depends'  : ['tyru/open-browser.vim'],
      \   'autoload' : {
      \     'commands' : ['OpenGithubFile', 'OpenGithubIssue'],
      \   }
      \ }
" }}}

" draw text boxes {{{
NeoBundleLazy 'vim-scripts/DrawIt', {
      \   'autoload' : { 'commands' : ['DIstart', 'DIstop', 'DrawIt'], }
      \ }
" }}}

" db access from vim {{{
NeoBundleFetch 'vim-scripts/dbext.vim'
" }}}

" Airline bundles {{{
NeoBundle 'vim-airline/vim-airline'
NeoBundleLazy 'vim-airline/vim-airline-themes'
NeoBundle 'bling/vim-bufferline'
" }}}

" targets additional text objects {{{
NeoBundle 'wellle/targets.vim'
" }}}

" indent line indicator {{{
NeoBundle 'Yggdroot/indentLine'
" }}}

" Text Objects {{{
NeoBundle 'kana/vim-textobj-user'
NeoBundleLazy 'kana/vim-textobj-entire', {'autoload':{'insert': 1, 'focus': 1}}                " ae | ie
NeoBundleLazy 'kana/vim-textobj-indent', {'autoload':{'insert': 1, 'focus': 1}}                " ai | ii
NeoBundleLazy 'kana/vim-textobj-lastpat', {'autoload':{'insert': 1, 'focus': 1}}               " a/ | i/
NeoBundleLazy 'haya14busa/vim-textobj-number', {'autoload':{'insert': 1, 'focus': 1}}          " an | in
NeoBundleLazy 'Julian/vim-textobj-variable-segment', {'autoload':{'insert': 1, 'focus': 1}}    " av | iv
NeoBundleLazy 'mattn/vim-textobj-url', {'autoload':{'filetypes': ['markdown']}}                " au | iu
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {'autoload': {'filetypes': ['ruby', 'eruby']}} " ar | ir
" }}}

" Writing {{{
NeoBundleLazy 'junegunn/goyo.vim', {
      \   'autoload' : { 'commands' : ['Goyo'] },
      \ }

NeoBundleLazy 'junegunn/limelight.vim', {
      \   'autoload' : { 'commands' : ['Limelight', 'Limelight!'] },
      \ }
" }}}

" HTML/XML {{{
NeoBundleLazy 'othree/html5.vim', {'autoload': {'filetypes': ['html', 'xml', 'eruby', 'eelixir']}}
NeoBundleLazy 'gregsexton/MatchTag', {'autoload': {'filetypes': ['html', 'xml', 'eruby', 'eelixir']}}
NeoBundleLazy 'mattn/emmet-vim', {'autoload': {'filetypes': ['html', 'xml', 'eruby', 'eelixir']}}
" }}}

" Template Engines {{{
NeoBundleLazy 'digitaltoad/vim-jade'
NeoBundleLazy 'nono/vim-handlebars'
NeoBundleLazy 'posva/vim-vue'
NeoBundleLazy 'slim-template/vim-slim'
NeoBundleLazy 'tpope/vim-haml'
NeoBundleLazy 'tpope/vim-liquid'
" }}}

" CSS {{{
NeoBundleLazy 'ap/vim-css-color', {'autoload': {'filetypes': ['css', 'sass', 'scss', 'less']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload': {'filetypes': ['css', 'sass', 'scss', 'less']}}
NeoBundleLazy 'othree/csscomplete.vim', {'autoload': {'filetypes': ['css', 'sass', 'scss', 'less']}}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload': {'filetypes': ['sass', 'scss']}}
NeoBundleLazy 'groenewege/vim-less', {'autoload': {'filetypes': 'less'}}
" }}}

" JSON/ProtoBuf {{{
NeoBundleLazy 'elzr/vim-json', {'autoload': {'filetypes': ['json', 'javascript']}}
NeoBundleLazy 'uarun/vim-protobuf', {'autoload': {'filetypes': 'proto'}}
" }}}

" JavaScript/CoffeeScript {{{
NeoBundle 'kchmck/vim-coffee-script', {'autoload': {'filetypes': ['coffee']}}
NeoBundle 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript', 'coffee']}}
NeoBundleLazy 'othree/yajs.vim', {'autoload': {'filetypes': ['javascript', 'coffee']}}
NeoBundleLazy 'othree/es.next.syntax.vim', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload': {'filetypes': ['javascript', 'coffee']}}
NeoBundleLazy 'moll/vim-node', {'autoload': {'filetypes': ['javascript', 'coffee']}}
NeoBundleLazy 'MaxMEllon/vim-jsx-pretty', {'autoload': {'filetypes': ['javascript', 'coffee']}}
NeoBundleFetch 'marijnh/tern_for_vim', {
      \   'autoload': { 'filetypes': ['javascript'] },
      \   'build': {
      \     'windows': 'npm install',
      \     'cygwin': 'npm install',
      \     'mac': 'npm install',
      \     'unix': 'npm install',
      \   },
      \ }
" }}}

" Ruby/Rails {{{
NeoBundle 'vim-ruby/vim-ruby', {'autoload': {'filetypes': ['ruby', 'eruby']}}
NeoBundleLazy 'tpope/vim-rails', {'depends': ['tpope/vim-projectionist'], 'autoload': {'filetypes': ['ruby', 'eruby']}}
" Ruby ecosystem
NeoBundleLazy 'tpope/vim-rbenv', {'autoload': {'filetypes': ['ruby', 'eruby']}}
NeoBundleLazy 'tpope/vim-bundler' " slows down NeoComplete
NeoBundleLazy 'tpope/vim-rake' " slows down NeoComplete
NeoBundleLazy 'keith/rspec.vim', {'autoload': {'filetypes': ['ruby', 'eruby']}}
" Refactoring macros for Ruby/Rails
NeoBundleLazy 'ecomba/vim-ruby-refactoring'
" }}}

" Clojure {{{
NeoBundleLazy 'guns/vim-clojure-static', {'autoload': {'filetypes': 'clojure'}}
NeoBundleLazy 'guns/vim-clojure-highlight', {'autoload': {'filetypes': 'clojure'}}
NeoBundleLazy 'tpope/vim-classpath', {'autoload': {'filetypes': 'clojure'}}
NeoBundleLazy 'tpope/vim-fireplace', {'autoload': {'filetypes': 'clojure'}}
NeoBundleLazy 'tpope/vim-salve', {
      \   'depends' : ['tpope/vim-dispatch'],
      \   'autoload' : { 'filetypes': 'clojure' },
      \ }
" }}}

" Elixir {{{
NeoBundle 'elixir-lang/vim-elixir', {'autoload': {'filetypes': ['elixir', 'eelixir']}}
" https://github.com/slashmili/alchemist.vim/wiki
NeoBundleLazy 'slashmili/alchemist.vim', {'autoload': {'filetypes': ['elixir', 'eelixir']}}
" }}}

" C/Cpp {{{
NeoBundleLazy 'vim-jp/cpp-vim', {'autoload': {'filetypes': ['c', 'h', 'cpp', 'hpp']}}
NeoBundleLazy 'octol/vim-cpp-enhanced-highlight', {'autoload': {'filetypes': ['c', 'h', 'cpp', 'hpp']}}
" }}}

" Go {{{
NeoBundle 'fatih/vim-go', {
      \   'depends': ['Shougo/vimproc.vim', 'Shougo/neocomplete.vim'],
      \   'autoload': {'filetypes': ['go']},
      \ }
NeoBundleLazy 'garyburd/go-explorer', {'autoload': {'filetypes': ['go']}}
NeoBundleLazy 'rhysd/unite-go-import.vim', {'depends': ['Shougo/unite.vim'], 'autoload': {'filetypes': ['go']}}
" }}}

" Python {{{
NeoBundleLazy 'davidhalter/jedi-vim', {'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'tweekmonster/braceless.vim', {'autoload': {'filetypes': ['python']}}
" }}}

" Markdown {{{
NeoBundle 'gabrielelana/vim-markdown', {'autoload':{'filetypes': ['markdown']}}
" Highlight code in Markdown
NeoBundleLazy 'blindFS/vim-regionsyntax', {'autoload': {'filetypes': ['markdown']}}
" Presentation in Markdown, n next slide, p previous slide, q quit
NeoBundleLazy 'sotte/presenting.vim', {'autoload': {'commands': ['PresentingStart']}}
" Preview Markdown Result in Browser
NeoBundleLazy 'kannokanno/previm', {
      \   'depends': ['tyru/open-browser.vim'],
      \   'autoload': {'commands': ['PrevimOpen']}
      \ }
" }}}

" Git {{{
NeoBundle 'airblade/vim-gitgutter'
NeoBundleLazy 'tpope/vim-git', {'autoload': {'filetypes': 'git'}}
" <CR> Jump to the revision under the cursor.
" o    Jump to the revision under the cursor in a new split.
" S    Jump to the revision under the cursor in a new
" O    Jump to the revision under the cursor in a new tab.
" -    Go to the tree containing the current tree or blob.
" ~    Go to the current file in the [count]th first ancestor.
" P    Go to the current file in the [count]th parent.
NeoBundle 'tpope/vim-fugitive'
" Magit in Vim, N next hunk, S stage/unstage, CC commit message
NeoBundleLazy 'jreybert/vimagit', {
      \   'autoload': {'commands': ['Magit', 'MagitOnly']}
      \ }
" A fast git commit browser
NeoBundleLazy 'junegunn/gv.vim', {
      \   'depends': ['tpope/vim-fugitive'],
      \   'autoload': {'commands': ['GV', 'GV!', 'GV?']}
      \ }
" }}}

" Others {{{
NeoBundleLazy 'alcesleo/vim-uppercase-sql', {'autoload': {'filetypes': 'sql'}}
NeoBundleLazy 'chase/vim-ansible-yaml', {'autoload': {'filetypes': 'ansible'}}
NeoBundleLazy 'evanmiller/nginx-vim-syntax', {'autoload': {'filetypes': 'nginx'}}
NeoBundleLazy 'honza/dockerfile.vim', {'autoload': {'filetypes': 'Dockerfile'}}
NeoBundleLazy 'tbastos/vim-lua', {'autoload': {'filetypes': 'lua'}}
NeoBundleLazy 'tmux-plugins/vim-tmux', {'autoload': {'filetypes': 'tmux'}}
NeoBundleLazy 'tpope/vim-cucumber', {'autoload': {'filetypes': 'feature'}}
" }}}

" Termimal (Tmux) {{{
NeoBundle 'christoomey/vim-tmux-navigator', {'terminal': 1}
NeoBundle 'sjl/vitality.vim', {'terminal': 1}
" }}}

" Colorschemes {{{
NeoBundle 'alessandroyorba/monrovia'
NeoBundleLazy 'chriskempson/base16-vim'
NeoBundleLazy 'dracula/vim'
NeoBundleLazy 'dikiaap/minimalist'
NeoBundleLazy 'jacoborus/tender'
NeoBundle 'KabbAmine/yowish.vim'
NeoBundleLazy 'kristijanhusak/vim-hybrid-material'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundleLazy 'rakr/vim-one'
NeoBundle 'rakr/vim-two-firewatch'
NeoBundleLazy 'romainl/flattened'
NeoBundleLazy 'tyrannicaltoucan/vim-quantum'
NeoBundle 'w0ng/vim-hybrid'
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:ft=vim:fdm=marker:sw=2:ts=2
