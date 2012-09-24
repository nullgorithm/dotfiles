" general
set nocompatible
set spelllang=en_ca
set history=500
set backspace=indent,eol,start
set number
set autoread
set whichwrap+=<,>,[,],h,l
set display=lastline
set virtualedit=block
set scrolloff=3
" no bells!
set noerrorbells visualbell t_vb=
" text wrapping
set wrap linebreak
" disable welcome screen and use short messages
set shortmess=atToOI

set backup backupdir=~/.vim/backup

if version >= 703
    set undofile undodir=~/.vim/undo
endif

" % matches on if/else, tags, etc.
runtime macros/matchit.vim

" insert-mode completion
let g:SuperTabDefaultCompletionType = "context"
" no completion previews
set completeopt=menu

let g:clang_use_library = 1
let g:clang_complete_auto = 0
let g:clang_periodic_quickfix = 1
let g:clang_library_path = "/usr/lib"

" command-line completion
set wildmenu wildmode=list:longest,full

" omit numbers in html output
let g:html_number_lines = 0

" statusline
set showmode showcmd ruler

" default indent style
set expandtab softtabstop=2 shiftwidth=2
set cinoptions=(0

autocmd FileType conque_term setlocal nocursorline
autocmd FileType c let g:clang_user_options = "-std=c11 2>/dev/null || exit 0"
autocmd FileType cpp let g:clang_user_options = "-std=c++11 2>/dev/null || exit 0"

autocmd FileType rst,markdown setl textwidth=79

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" detect filetype and use appropriate indenting and plugins
filetype indent plugin on

let mapleader = ","

" F5 toggles paste mode
set pastetoggle=<F5>

" F6 toggles spell checking
nn <F6> :setlocal spell! spell?<CR>

if has('mouse')
    set mouse=a
endif

" statusline
set laststatus=2
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'zenburn'

if has ('gui_running')
    " autoselect, console dialogs, don't source menu.vim
    set guioptions=acM
    set mousefocus
    set guifont=Monospace\ 9
    autocmd GUIEnter * set t_vb=
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
endif

" colors
set background=dark

if has ('gui_running') || &t_Co > 255
    colorscheme zenburn
    set cursorline
endif

if has ('gui_running') || &t_Co > 2
    syntax on
    " highlight trailing whitespace, except when typing at eol
    highlight ExtraWhitespace ctermbg=darkred guibg=darkred
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
endif
