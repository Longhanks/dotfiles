" Sane defaults when not using neovim
if !has('nvim')
    set nocompatible
    set encoding=utf8
else
    set guicursor=
endif

" Load plugins and indent settings for detected file types
filetype plugin indent on

" Enable syntax coloring, but don't overwrite custom color settings
syntax enable

" Sane tab settings
set tabstop=4
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set tabstop=4

" Indent as good as possible
set autoindent
set smartindent
set copyindent

" Don't beep
set noerrorbells
set novisualbell
set t_vb=

" Show line numbers
set number

" Auto reload file after external changes
set autoread

" Sane backspace behavior
set backspace=indent,eol,start

" Always show status bar, line/column, last command
set laststatus=2
set ruler
set showcmd

" Don't show mode, lightline does this
set noshowmode

" Always enable mouse support
set mouse=a

" Allow moving cursor one character past the end of the line
set virtualedit=onemore

" Highlight the line with the cursor
set cursorline

" Automatically set terminal title
set title

" Display graphical menu of options when autocompleting
set wildmenu

" Don't show intro message, start with empty file
set shortmess+=I

" Disable delay when pressing ESC
set ttimeoutlen=10

" set leader key to comma
let mapleader=","

" Set vim clipboard to system clipboard
set clipboard=unnamedplus

" Don't copy text on deletion
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

" Copy text on deletion when pressed with leader
nnoremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d

" Don't jump one char to left when exiting insert mdoe
inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" Search case insensitive unless query has capital letter
set ignorecase
set smartcase

" Search incrementally, globally, magically (regex)
set incsearch
set gdefault
set magic

" Use Ctrl-l to clear search highlight
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Fold by syntax, open most folds by default
set foldmethod=syntax
set foldlevelstart=10

" Remap space to open/close folds
nnoremap <space> za

" Remap movements
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

noremap <silent> <expr> <Down> (v:count == 0 ? 'g<Down>' : '<Down>')
noremap <silent> <expr> <Up> (v:count == 0 ? 'g<Up>' : '<Up>')



" Plugins



" Load all plugins by default.
packloadall

if has('nvim')
    packadd YouCompleteMe
endif

" Color scheme settings
let g:lightline = {
  \ 'colorscheme': 'one',
  \ }

if has('termguicolors')
    if !empty($COLORTERM)
        if ($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
            set termguicolors
        endif
    endif
endif
let s:white = { 'gui': '#ABB2BF', 'cterm': '145', 'cterm16' : '7' }
let s:selection = { 'gui': '#575A60', 'cterm': '236', 'cterm16': '8' }
" Use terminal's background
autocmd ColorScheme * call onedark#set_highlight('Normal', { 'fg': s:white })
" Match parenthesis with cursor as background
autocmd ColorScheme * call onedark#set_highlight('MatchParen', { 'bg': s:selection})
colorscheme onedark

set showtabline=2
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Don't show preview window with completion
set completeopt-=preview

" Allow selecting completion with enter
inoremap <expr> <Enter> pumvisible() ? "<Esc>a" : "<Enter>"

" Don't warn about global completion config file
let g:ycm_confirm_extra_conf = 0

" Provide default global completion file
let g:ycm_global_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Provide python paths on OS X
if has('unix')
    if system('uname -s') == 'Darwin\n'
        let g:python_host_prog='/usr/local/bin/python2'
        let g:python3_host_prog='/usr/local/bin/python3'
    endif
endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

