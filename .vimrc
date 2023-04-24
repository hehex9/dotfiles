"execute pathogen#infect()
set nocompatible
filetype off

" colorscheme solarized

filetype plugin indent on
filetype on

syntax enable

set encoding=utf8

set backspace=indent,eol,start
set nu
set mouse=a
set autoread
" autoreload when entering the buffer or gaining focus
au FocusGained,BufEnter * :silent! !

set hlsearch
set incsearch

set nobackup
set nowb
set noswapfile

set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set cul

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set listchars=tab:>-,trail:-
set list

set background=dark


"map
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
" use Enter to select when autocomplete menu opened
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
