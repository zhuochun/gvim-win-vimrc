""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVIM Configurations
" Author:    Wang Zhuochun
" Last Edit: 12/Oct/2013 05:10 AM
" vim:fdm=marker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set macmeta
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle Settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \   'windows' : 'make -f make_mingw32.mak',
    \   'cygwin' : 'make -f make_cygwin.mak',
    \   'mac' : 'make -f make_mac.mak',
    \   'unix' : 'make -f make_unix.mak',
    \   },
    \ }

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'AndrewRadev/switch.vim'
    nnoremap + :Switch<CR>
    " Some customized definitions
    let g:switch_custom_definitions =
            \ [
            \   ['else', 'elsif', 'else if'],
            \   ['&', '|', '^'],
            \   ['==', '!='],
            \   [' + ', ' - '],
            \   ['-=', '+='],
            \   ['if', 'unless'],
            \   ['yes', 'no'],
            \   ['first', 'last'],
            \ ]

NeoBundle 'bling/vim-airline'
    " enable/disable powerline symbols.
    let g:airline_powerline_fonts = 1
    " control which sections get truncated and at what width. >
    let g:airline#extensions#default#section_truncate_width = {
            \ 'b': 79,
            \ 'x': 60,
            \ 'y': 88,
            \ 'z': 45,
            \ }
    " enable/disable showing a summary of changed hunks under source control. >
    let g:airline#extensions#hunks#enabled = 0

NeoBundle 'bling/vim-bufferline'

NeoBundle 'bufkill.vim'

NeoBundle 'bkad/CamelCaseMotion'
    " use 'W', 'B' and 'E' to navigate
    nmap <S-W> <Plug>CamelCaseMotion_w
    nmap <S-B> <Plug>CamelCaseMotion_b
    nmap <S-E> <Plug>CamelCaseMotion_e

NeoBundle 'derekwyatt/vim-fswitch'

NeoBundle 'godlygeek/tabular'
    vnoremap <leader>a& :Tabularize /&<CR>
    vnoremap <leader>a= :Tabularize /=<CR>
    vnoremap <leader>a: :Tabularize /:\zs<CR>
    vnoremap <leader>a- :Tabularize /-\zs<CR>

NeoBundle 'jiangmiao/auto-pairs'
    " toggle auto pairs
    let g:AutoPairsShortcutToggle = '<M-a>'

NeoBundle 'kshenoy/vim-signature'

NeoBundle 'Lokaltog/vim-easymotion'
    let g:EasyMotion_leader_key = '\'
    " Tweak the colors
    hi link EasyMotionTarget WarningMsg
    hi link EasyMotionShade Comment

NeoBundle 'majutsushi/tagbar'
    nnoremap <F3> :TagbarToggle<CR>
    " Modify tagbar settings
    let g:tagbar_left = 0                " dock to the right (default)
    let g:tagbar_autofocus = 1           " auto focus on Tagbar when opened
    let g:tagbar_width = 27              " default is 40
    let g:tagbar_compact = 1             " omit vacant lines
    let g:tagbar_sort = 0                " sort according to order

" JavaScript omni complete
NeoBundle 'marijnh/tern_for_vim', {
    \ 'build': {
    \   'mac': 'npm install',
    \   'unix': 'npm install',
    \   'cygwin': 'npm install',
    \   'windows': 'npm install',
    \   },
    \ }

NeoBundle 'matchit.zip'

NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
    let g:gist_clip_command = 'pbcopy'
    " if you want to detect filetype from the filename
    let g:gist_detect_filetype = 1
    " If you want to show your private gists with :Gist -l
    let g:gist_show_privates = 1
    " If you want your gist to be private by default
    let g:gist_post_private = 1

NeoBundle 'mattn/emmet-vim'
    " <C-y> to enter emmet actions
    " <D-y> to expand input in insert mode
    let g:user_emmet_expandabbr_key = '<D-y>'
    " enable emment functions in insert mode
    let g:user_emmet_mode='i'

NeoBundle 'maxbrunsfeld/vim-yankstack'
    let g:yankstack_map_keys = 0
    " <M-p> - cycle backward through your history of yanks
    nmap <M-p> <Plug>yankstack_substitute_older_paste
    " <M-P> - cycle forwards through your history of yanks
    nmap <M-P> <Plug>yankstack_substitute_newer_paste

NeoBundle 'mileszs/ack.vim'
    " Ack [options] {pattern} [{directory}]
    " Use ag instead
    let g:ackprg = 'ag --nogroup --nocolor --column'

NeoBundle 'scrooloose/syntastic'
    " Do a manual syntastic check
    nnoremap <silent> <F7>   :SyntasticCheck<CR>
    " Toggle syntastic between active and passive mode
    nnoremap <silent> <C-F7> :SyntasticToggleMode<CR>
    " Output info about what checkers are available and in use
    nnoremap <silent> <S-F7> :SyntasticInfo<CR>
    " error window will be automatically opened and closed
    let g:syntastic_auto_loc_list = 1
    " automatic syntax checking
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['javascript', 'ruby'],
                               \ 'passive_filetypes': ['html', 'css'] }
    " syntax checking method for ruby, ['mri', 'rubocop']
    let g:syntastic_ruby_checkers = ['mri', 'rubocop']

NeoBundle 'scrooloose/nerdcommenter'
    " use / to toggle comments
    vnoremap <M-/> :call NERDComment('v', "toggle")<CR>
    nnoremap <M-/> :call NERDComment('n', "toggle")<CR>

NeoBundle 'scrooloose/nerdtree'
    " Make it colourful and pretty
    let NERDChristmasTree = 1
    " size of the NERD tree
    let NERDTreeWinSize = 27
    " Disable 'bookmarks' and 'help'
    let NERDTreeMinimalUI = 1
    " Highlight the selected entry in the tree
    let NERDTreeHighlightCursorline = 1
    " Use a single click to fold/unfold directories
    let NERDTreeMouseMode = 2
    " Don't display these kinds of files in NERDTree
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', '\.aps', '\.vcxproj']

NeoBundle 'jistr/vim-nerdtree-tabs'
    map <F10> <plug>NERDTreeTabsToggle<CR>
    " Do not open NERDTree on startup
    let g:nerdtree_tabs_open_on_gui_startup=0

NeoBundle 'Shougo/unite.vim'
    " Use recursive file search
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    " File searching like ctrlp.vim, start in insert mode
    nnoremap <D-u> :<C-u>Unite -start-insert file_rec/async:!<CR>
    " Buffer switching like LustyJuggler
    nnoremap <D-i> :<C-u>Unite -quick-match buffer<CR>
    " Most recently used files
    nnoremap <M-o> :<C-u>Unite file_mru<CR>
    " Content searching like ack.vim
    nnoremap <D-/> :<C-u>Unite grep:.<CR>
    " Enabled to track yank history
    let g:unite_source_history_yank_enable = 1
    " Yank history like YankRing
    nnoremap <D-y> :<C-u>Unite history/yank<CR>
    " Unite spilt position
    let g:unite_split_rule = 'botright'

    " Use ag
    if executable('ag')
        " Use ag in unite grep source.
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts =
            \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
            \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
        let g:unite_source_grep_recursive_opt = ''
    endif

    " Key Mappings in Unite
    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings() "{{{
        " Overwrite settings.
        nmap <buffer> <ESC> <Plug>(unite_exit)
        nmap <buffer> <leader>d <Plug>(unite_exit)
        imap <buffer> <TAB> <Plug>(unite_select_next_line)
        imap <buffer> <S-TAB> <Plug>(unite_select_previous_line)
    endfunction "}}}

NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler.vim'
    let g:vimfiler_as_default_explorer = 1
    " open vimfiler
    nnoremap <C-F10> :<C-U>:VimFilerExplorer -toggle<CR>
    " ignore files with filename patterns
    let g:vimfiler_ignore_pattern = '^\%(.git\|.DS_Store\|.pyc\|.vcxproj\)$'
    " <C-l> <Plug>(vimfiler_redraw_screen)
    " c     <Plug>(vimfiler_copy_file)
    " m     <Plug>(vimfiler_move_file)
    " d     <Plug>(vimfiler_delete_file)
    " r     <Plug>(vimfiler_rename_file)
    " K     <Plug>(vimfiler_make_directory)
    " N     <Plug>(vimfiler_new_file)
    " e     <Plug>(vimfiler_edit_file)
    " E     <Plug>(vimfiler_split_edit_file)
    " Q     <Plug>(vimfiler_exit)
    " t     <Plug>(vimfiler_expand_tree)

NeoBundle 'Shougo/neocomplcache.vim'
    " Enable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 2
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Use auto delimiter
    let g:neocomplcache_enable_auto_delimiter = 1
    " Max list length
    let g:neocomplcache_max_list = 10
    " overwrite complete func!
    let g:neocomplcache_force_overwrite_completefunc = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
    " <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    " <SPACE>: Close popup.
    inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup()."\<Space>" : "\<Space>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType php setlocal omnifunc=phpcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType c set omnifunc=ccomplete#Complete

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

NeoBundle 'Shougo/neosnippet.vim'
    " Plugin key-mappings.
    imap <D-d> <Plug>(neosnippet_expand_or_jump)
    smap <D-d> <Plug>(neosnippet_expand_or_jump)
    xmap <D-d> <Plug>(neosnippet_expand_target)

    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1
    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    let g:snips_author='Wang Zhuochun'
    let g:snips_email='stone1551@gmail.com'
    let g:snips_github='https://github.com/zhuochun'

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview

" A neocomplcache plugin for /usr/bin/look
" to complete words in Englis
NeoBundle 'ujihisa/neco-look'

NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'terryma/vim-multiple-cursors'
    " Disable default mapping: ctrl + n/p/x
    let g:multi_cursor_use_default_mapping=0
    " New mapping
    let g:multi_cursor_next_key='<M-,>'
    let g:multi_cursor_prev_key='<M-.>'
    let g:multi_cursor_skip_key='<M-m>'
    let g:multi_cursor_quit_key='<Esc>'

NeoBundle 'Valloric/MatchTagAlways'

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'
    let g:notes_directories = ['~/Dropbox/Mac/Note']
    let g:notes_suffix = '.md'
    let g:notes_tab_indents = 0
    let g:notes_markdown_program = 'kramdown'

NeoBundle 'Yggdroot/indentLine'
NeoBundle 'zhuochun/vim-snippets'

" text objects {{{
NeoBundle 'kana/vim-textobj-user'
" a,/i, for an argument to a function
NeoBundle 'sgur/vim-textobj-parameter'
" av/iv for a region between either _s or camelCaseVariables
NeoBundle 'Julian/vim-textobj-variable-segment'
" ar/ir for a ruby block
NeoBundle 'nelstrom/vim-textobj-rubyblock'
" ac/ic for a column block
NeoBundle 'coderifous/textobj-word-column.vim'
" }}}

" language syntax {{{
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
    let g:used_javascript_libs = 'jquery,underscore,backbone,requirejs,angularjs'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'skammer/vim-css-color'
    let g:cssColorVimDoNotMessMyUpdatetime = 1
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
    let g:rubycomplete_buffer_loading = 1
    let g:rubycomplete_classes_in_global = 1
    let g:rubycomplete_rails = 1
    let g:rubycomplete_use_bundler = 1
NeoBundle 'vim-jp/cpp-vim'
NeoBundle "wavded/vim-stylus"
" }}}

" colorschemes {{{
NeoBundle 'tomasr/molokai'
    let g:molokai_original = 0
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'chriskempson/base16-vim'
" }}}

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" colorschemes
if has("gui_running")
    colorscheme base16-eighties
else
    colorscheme Tomorrow-Night-Eighties
endif
" colorscheme background
set background=dark
" vim fonts
"set guifont=Anonymous\ Pro\ for\ Powerline:h16
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h16
"set guifont=Inconsolata\ for\ Powerline:h18
" vim window size
set lines=42 columns=129

" enable filetype plugin
filetype plugin on
filetype indent on
filetype on

" , is much easier
" \ is used in EasyMotion
let mapleader = ","
let g:mapleader = ","

" Syntax highlighting on
syntax on

" t - autowrap text, c - autowrap comments, r - insert comment leader
" mM - useful for Chinese characters, q - gq
set formatoptions -=o
set formatoptions +=tcrqmM

" encoding
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese,gbk

" status line
set laststatus=2

" basic settings
set shortmess=atI                   " No welcome screen in gVim
set mouse=a                         " Enable Mouse
set timeoutlen=30                   " Quick timeouts for command combinations
set history=999                     " keep 999 lines of command line history
set ruler                           " show the cursor position all the time
set relativenumber                  " show line number relatively
set lazyredraw
set hidden                          " change buffer even if it is not saved
set lbr                             " dont break line within a word
set showcmd                         " display incomplete commands
set showmode                        " show current mode
"set autochdir                      " automatically change to current file location
set cursorline                      " highlight the current line
set magic                           " Set magic on, for regular expressions
set winaltkeys=no                   " Set ALT not map to toolbar

set wildmenu                        " Show autocomplete menus
set wildignore+=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.aps,*.vcxproj.*
set wildignore+=*$py.class,*.class,*.gem,*.zip

set scrolljump=6                    " lines to scroll when cursor leaves screen
set scrolloff=9                     " minimum lines to keep above and below cursor

" related to <TAB> indents
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" related to indents
set autoindent                      " always set autoindenting on
set smartindent
set cindent                         " indent for c/c++
set autoread                        " autoread when a file is changed from the outside

" word boundary to be a little bigger than the default
set iskeyword+=_,$,@,%,#,`,!,?
set iskeyword-=-

" Related to Search {{{
set ignorecase                      " Ignore case when searching
set smartcase
set hlsearch                        " Highlight search things
set incsearch                       " Make search act like search in modern browsers
"set gdefault                       " search/replace global by default
set showmatch                       " Show matching bracets
set mat=1                           " Blink How many times
" }}}

" folding settings {{{
set foldmethod=indent               " fold based on indent
set foldnestmax=99                  " deepest fold levels
set nofoldenable                    " dont fold by default
" }}}

" No sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" backups and undos {{{
"set nobackup
"set nowb
"set noswapfile

" Turn backup on
set backup
set backupdir=/tmp/,~/tmp,~/Temp

" Swap files
set swapfile
set directory=/tmp/,~/tmp,~/Temp

" Persistent undo
set undofile
if has("unix")
    set undodir=/tmp/,~/tmp,~/Temp
else
    set undodir=$HOME/temp/
endif

if has('persistent_undo')
    set undofile         " So is persistent undo ...
    set undolevels=1000  " Maximum number of changes that can be undone
    set undoreload=10000 " Maximum number lines to save for undo on a buffer reload
endif
" }}}

" Set backspace config
set backspace=start,indent,eol
set whichwrap+=<,>,b,s

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings and Settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Function keys {{{
    " F1  Help
    " F2  Insert date and time
    inoremap <F2> <C-R>=strftime("%d/%b/%Y %I:%M %p")<CR>
    " F3  Toggle Tagbar
    " F4
    " F5
    " F6  Paste mode
    set pastetoggle=<F6>
    " F7  Manual syntastic check
    " F8
    " F9  Toggle iTerm 2
    " F10 Toggle NERDTree
    " F11 Toggle Menu and Toolbar {{{
    set go=
    map <silent> <F11> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <bar>
        \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
        \endif<CR>
    " }}}
    " F12
" }}}

" use <Tab> and <S-Tab> to indent
" in Normal, Visual, Select Mode
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" Move a line of text using <up><down>
nmap <up> mz:m-2<cr>`z
nmap <down> mz:m+<cr>`z
vmap <up> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <down> :m'>+<cr>`<my`>mzgv`yo`z
" Or Comamnd+[jk] on mac
nmap <M-k> mz:m-2<cr>`z
nmap <M-j> mz:m+<cr>`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z

" normal char key mappings {{{
    " Q: to repeat last recorded macro
    nmap Q @@
    " Y: Quick yanking to the end of the line
    nmap Y y$
    " H: Go to beginning of line.
    "    Repeated invocation goes to previous line
    nnoremap <expr> H getpos('.')[2] == 1 ? 'k' : '0'
    " L: Go to end of line.
    "    Repeated invocation goes to next line
    nnoremap <expr> L <SID>end_of_line()
    function! s:end_of_line()
      let l = len(getline('.'))
      if (l == 0 || l == getpos('.')[2])
        return 'jg_'
      else
        return 'g_'
    endfunction
    " Change folder mappings
    " zo: Open all folds under the cursor recursively
    nnoremap zo zO
    " zO: Open all folds
    nnoremap zO zR
    " zC: Close all folds
    nnoremap zC zM
    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv
    " Make space work in normal mode
    nnoremap <space> i<space><ESC>
    " Make enter work in normal mode
    nnoremap <CR> i<CR><ESC>
" }}}

" normal char key mappings {{{
    " <`> Move to mark (linewise)
    " <~> Up/Downcase
    " <0-9> 0-9
    " <!>
    " <@> Register
    " <#> Search word under cursor backwards
    " <$> To the end of the line
    " <%> Move between open/close tags
    " <^> To the first non-blank character of the line.
    " <&> Synonym for `:s` (repeat last substitute)
    " <*> Search word under cursor forwards
    " <(> Sentences backward
    " <)> Sentences forward
    " <_> Horizonal split
    " <->
    " <==> Format current line
    " <+> Switch
    " <S-Delete> Insert Mode Delete word
    " <q*> Record Macro
    " <w> Word forwards
    " <W> Word forwards (CamelCase)
    " <e> Forwards to the end of word
    " <E> Forwards to the end of word
    " <r> Replace char
    " <R> Continous replace
    " <t> find to left (exclusive)
    " <T> find to left (inclusive)
    " <y> Yank into register
    " <u> Undo
    " <i> Insert
    " <o> Open new line below
    " <O> Open new line above
    " <p> Paste Yank
    " <{> Paragraphs backward
    " <}> Paragraphs forward
    " <\> Easymotion
    " <|> Vertical split
    " <a> Append insert
    " <s> Substitue
    " <d> Delete
    " <f> find to right (exclusive)
    " <F> find to right (inclusive)
    " <g> Go
    " <h> Left
    " <j> Down
    " <J> Join Sentences
    " <k> Up
    " <l> Right
    " <;> Repeat last find f,t,F,T
    " <:> Comamnd Input
    " <''> Move to previous context mark, alias to <m'>
    " <'*> Move to {a-zA-Z} mark
    " <"*> Register
    " <CR> Open new line at cursor
    " <z*> Folds
    " <x> Delete char cursor
    " <c> Change
    " <v> Visual
    " <b> Words Backwards
    " <B> Words Backwards (CamelCase)
    " <n> Next search
    " <N> Previous search
    " <m*> Set mark {a-zA-Z}
    " <,> Repeat last find f,t,F,T in opposite direction
    " <.> Repeat last command
" }}}


" <leader>* key mappings {{{
    " <leader>1
    " <leader>2
    " <leader>3
    " <leader>4
    " <leader>5
    " <leader>6
    " <leader>7
    " <leader>8
    " <leader>9
    " <leader>0
    " <leader>-
    " <leader>= align with =
    " <leader>q quick quit without save
    nnoremap <leader>q :q!<CR>
    " <leader>w
    nmap <silent> <leader>w :call ToggleWrap()<cr>
    function! ToggleWrap()
        nnoremap <silent> j gj
        nnoremap <silent> k gk
        nnoremap <silent> 0 g0
        nnoremap <silent> $ g$
    endfunction
    " <leader>e
    " <leader>r
    " <leader>t
    " <leader>y
    " <leader>u
    " <leader>i
    " <leader>o
    " <leader>p
    " <leader>a
    " <leader>s spell checkings
        nnoremap <leader>ss :setlocal spell!<cr>
        nnoremap <leader>sn ]s
        nnoremap <leader>sp [s
        nnoremap <leader>sa zg
        nnoremap <leader>s? z=
    " <leader>S clear trailing whitespace
    nnoremap <leader>S :%s/\s\+$//ge<cr>:nohl<cr>
    nnoremap \s :%s/\s\+$//ge<cr>:nohl<cr>
    " <leader>d close buffer
    nnoremap <leader>d :BD<CR>
    " <leader>D close buffer
    nnoremap <leader>D :bdelete<CR>
    nnoremap \d :bdelete<CR>
    " <leader>f easier code formatting
    nnoremap <leader>f gg=G''
    " <leader>g
    " <leader>h
    " <leader>j
    " <leader>k
    " <leader>l
    " <leader>L reduce a sequence of blank lines into a single line
    nnoremap <leader>L GoZ<Esc>:g/^[ <Tab>]*$/.,/[^ <Tab>]/-j<CR>Gdd
    " <leader>z
    " <leader>x
    " <leader>c
    " <leader>v select the just pasted text
    nnoremap <leader>v V`]
    " <leader>b
    " <leader>n
    " <leader>m
    " <leader>M remove the ^M - when the encodings gets messed up
    nnoremap <leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
    nnoremap \m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
    " <leader><space> close search highlight
    nnoremap <silent> <leader><space> :noh<cr>
" }}}

" Tabs and Windows mappings {{{
    " Tab Mappings
    nmap <D-_> :tabprevious<cr>
    nmap <D-+> :tabnext<cr>
    nmap <D-1> 1gt
    nmap <D-2> 2gt
    nmap <D-3> 3gt
    nmap <D-4> 4gt
    nmap <D-5> 5gt
    nmap <D-6> 6gt
    nmap <D-7> 7gt
    nmap <D-8> 8gt
    nmap <D-9> 9gt
    nmap <D-0> :tablast<CR>
    nmap <D-t> :tabnew<CR>
    nmap <D-w> :tabclose<CR>
    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    nmap <D-e> :tabedit <c-r>=expand("%:p:h")<cr>/

    " Smart way to move btw. windows
    nmap <C-j> <C-W>j
    nmap <C-k> <C-W>k
    nmap <C-h> <C-W>h
    nmap <C-l> <C-W>l

    " Use arrows to change the splited windows
    nmap <right> <C-W>L
    nmap <left> <C-W>H
    nmap <C-up> <C-W>K
    nmap <C-down> <C-W>J

    " _ : Quick horizontal splits
    nnoremap _ :sp<cr>
    " | : Quick vertical splits
    nnoremap <bar> :vsp<cr>

    " Always splits to the right and below
    set splitright
    set splitbelow
" }}}

" <Ctrl-*> key mappings {{{
    " <C-1> Mac Desktop Switch
    " <C-2> Mac Desktop Switch
    " <C-3> Mac Desktop Switch
    " <C-4> Mac Desktop Switch
    " <C-5> Mac Desktop Switch
    " <C-6>
    " <C-7>
    " <C-8>
    " <C-9>
    " <C-0>
    " <C-->
    " <C-=>
    " <C-q> Multiple select
    " <C-w>
    " <C-e>
    " <C-r>
    " <C-t>
    " <C-y> Emmet Expand
    " <C-u>
    " <C-i>
    " <C-o>
    " <C-p>
    " <C-a>
    " <C-s>
    " <C-d>
    " <C-f>
    " <C-g>
    " <C-h> (n) move to left window
    " <C-j> (n) move to down window
    " <C-k> (n) move to up window
    " <C-l> (n) move right window
    " <C-;>
    " <C-'>
    " <C-CR> Like in Visual Studio
    inoremap <C-CR> <ESC>o
    " <C-S-CR> Like in Visual Studio
    inoremap <C-S-CR> <ESC>O
    " <S-CR> Like in Visual Studio
    inoremap <S-CR> <ESC>O
    " <C-z>
    " <C-x>
    " <C-c>
    " <C-v>
    " <C-b>
    " <C-n>
    " <C-m>
    " <C-,>
    " <C-.>
" }}}

" Insert mode Emacs key mappings {{{
    " some Emacs key bindings in insert mode
    inoremap <C-a> <HOME>
    inoremap <C-e> <END>
    " <C-h> move word left
    inoremap <C-h> <C-O>B
    " <C-j>: Move cursor down
    inoremap <expr> <C-j> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"
    " <C-k>: Move cursor up
    inoremap <expr> <C-k> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"
    " <C-l>: Move word right
    inoremap <C-l> <C-O>W
    " <C-f>: Move move cursor left
    inoremap <C-f> <LEFT>
    " <C-b>: Move move cursor right
    inoremap <C-b> <RIGHT>
    " <C-a>: command mode HOME
    cnoremap <C-a> <home>
    " <C-e>: command mode END
    cnoremap <C-e> <end>
    " <C-h>: command mode cursor left
    cnoremap <C-h> <s-left>
    " <C-l>: command mode cursor right
    cnoremap <C-l> <s-right>
    " <C-@>: command mode show command history
    cnoremap <C-@> <c-f>
" }}}

" <M-*> key mappings {{{
    " <M-q>
    " <M-w>
    " <M-e>
    " <M-r>
    " <M-t>
    " <M-y>
    " <M-u>
    " <M-i>
    " <M-o>
    " <M-p> Yankstack old
    " <M-P> Yankstack new
    " <M-[>
    nnoremap <M-[> :lprevious<CR>
    " <M-]>
    nnoremap <M-]> :lNext<CR>
    " <M-a>
    " <M-s>
    " <M-d>
    " <M-f>
    " <M-g>
    " <M-h>
    " <M-j> Move selected line down
    " <M-k> Move selected line up
    " <M-l>
    " <M-;>
    " <M-'>
    " <M-z>
    " <M-x>
    " <M-c>
    " <M-v>
    " <M-b>
    " <M-n>
    " <M-m>
    " <M-m> vim-multiple-cursors: skip
    " <M-,> vim-multiple-cursors: next
    " <M-.> vim-multiple-cursors: prev
    " <M-/> NERDComment
" }}}

" <D-*> key mappings {{{
    " <D--> Mac Smaller font
    " <D-=> Mac Larger font
    " <D-q> Mac Quit
    " <D-w> Mac Close
    " <D-e>
    " <D-r>
    " <D-t> Mac New Tab
    " <D-y> (Normal) Yank History
    " <D-y> (Insert) Emmet expand, alias to <C-y>,
    " <D-u> Unite files
    " <D-i> Unite buffers
    " <D-o> Mac File Open
    " <D-p> Mac Print
    " <D-a> Mac Select all
    " <D-s> Mac Save
    " <D-d> Snippet autocomplete
    " <D-f>
    " <D-g>
    " <D-h>
    " <D-j>
    " <D-k>
    " <D-l> Mac List Errors
    " <D-;> Mac Go to Next Error
    " <D-:> Mac Suggest Correction to Next Error
    " <D-'>
    " <D-z> Mac Undo
    " <D-x> Mac Cut
    " <D-c> Mac Copy
    " <D-v>
    " <D-b>
    " <D-n> Mac New Window
    " <D-m> Mac Minimize windows
    " <D-,> Mac Advance settings
    " <D-.> Cannot map
    " <D-/> Unite grep
" }}}

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode related {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" In visual mode, press * or # to search the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional Settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source the vimrc file after saving it
autocmd! bufwritepost .vimrc source $MYVIMRC

" Quick edit _vimrc and code_complete template
nmap <leader>0 :e $MYVIMRC<CR>
nmap <leader>) :tabnew $MYVIMRC<CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" fix Vim’s horribly broken default regex
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" C/CPP Mappings {{{
    au FileType cpp,c,cc,h,hpp :call CppDef()
    function! CppDef()
        " FSwitch (support cpp better than a.vim) {{{
        map <F4>   :FSHere<CR>
        map <F5>   :FSSplitRight<CR>
        map <C-F5> :FSSplitLeft<CR>
        " }}}

        " Correct typos that only in C/Cpp
        iab uis        usi
        iab cuot       cout
        iab itn        int
        iab Bool       bool
        iab boolean    bool
        iab Static     static
        iab Virtual    virtual
        iab True       true
        iab False      false
        iab String     string
        iab prinft     printf
        iab pritnt     printf
        iab pirntf     printf
        iab boll       bool
        iab end;       endl;
        iab color      colour
        iab null       NULL
    endfunction
" }}}

" Ruby Mappings {{{
    au FileType ruby,eruby,rdoc,coffee :call RubyDef()
    function! RubyDef()
        setlocal shiftwidth=2
        setlocal tabstop=2

        " Correct typos
        iab elseif     elsif
    endfunction
" }}}

" Html/Xml Mappings {{{
    au FileType xhtml,html,xml,yaml :call WebDef()
    function! WebDef()
        setlocal shiftwidth=2
        setlocal tabstop=2

        nnoremap <del> F<df>
        nnoremap <BS> F<df>

        " Correct typos
        iab colour color
    endfunction
" }}}

" Markdown Mappings {{{
    au FileType markdown :call MarkdownDef()
    function! MarkdownDef()
        setlocal shiftwidth=2
        setlocal tabstop=2

        " F2  Insert date and time in Jekyll
        inoremap <F2> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
    endfunction
" }}}

" Global Correct typos {{{
iab teh        the
iab fro        for
iab agian      again
iab tyr        try
iab itn        int
iab doulbe     double
iab vodi       void
iab brake;     break;
iab breka;     break;
iab breaka;    break;
iab labeled    labelled
iab seperate   separate
iab regester   register
iab ture       true
iab ?8         /*
iab /8         /*
iab /*         /*
" change working directory
cab cwd        cd %:p:h
" change local working directory
cab clwd       lcd %:p:h
" }}}

" list chars {{
set list
set listchars=tab:»»,trail:⌴,extends:§,nbsp:_
" }}

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Installation check.
NeoBundleCheck