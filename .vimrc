"execute pathogen#infect()
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'w0rp/ale'
Plugin 'gagoar/StripWhiteSpaces'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'kien/ctrlp.vim'
Bundle 'reasonml-editor/vim-reason'
Plugin 'mattn/emmet-vim'
Plugin 'ajh17/VimCompletesMe'
call vundle#end()

colorscheme solarized

filetype plugin indent on
filetype on

set encoding=utf8

syntax enable

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

set background=dark

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore = ['.pyc$', 'node_modules$']

let g:airline_powerline_fonts = 1

map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
" use Enter to select when autocomplete menu opened
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set listchars=tab:>-,trail:-
set list
autocmd FileType go setlocal noexpandtab nolist

"ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '··'
let g:ale_virtualenv_dir_names = ['envs', '.env', 'env', 've-py3', 've', 'virtualenv']
"let g:ale_python_pylint_options = '-rcfile ~/.config/pylint.rc'
let g:ale_linters = {
\   'python': ['flake8'],
\   'html': [''],
\}

"ctrlP
let g:ctrlp_map = '<c-p>'

"merlin
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
