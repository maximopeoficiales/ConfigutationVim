set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
"Configuration global
set title
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set cursorline
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2 
set relativenumber
set laststatus=2 
 
" Configuration extra Abel Github
set tabstop=5
set shiftwidth=5
set softtabstop=5
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s
set hidden  " Permitir cambiar de buffers sin tener que guardarlos
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
set splitbelow
set splitright

call plug#begin('~/.vim/plugged')

" Themes -> una vez instalado :pluginstall y wow
Plug 'morhetz/gruvbox'
" IDE CUSTOM
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
let NERDTreeQuitOnOpen=1 " Cierra NERDTREE cuando seleccione un archivo
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>qf :q!<CR>

