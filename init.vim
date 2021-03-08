"Configuration global set title
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
set modifiable
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
set tabstop=3
set shiftwidth=3
set softtabstop=3
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s
set hidden  " Permitir cambiar de buffers sin tener que guardarlos
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
set splitbelow
set splitright


call plug#begin("~/.vim/plugged")
  " Theme
  "Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  "Plug 'dracula/vim'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'pangloss/vim-javascript'  "Javascript Support
  Plug 'vim-airline/vim-airline' "barra de navegacion inteligente
  Plug 'vim-airline/vim-airline-themes' "temas para arline
  "Formater Code 
  Plug 'prettier/vim-prettier', { 'do': 'yarn install','branch': 'release/1.x'}
" Git in Vim
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
" Para PHP
Plug 'StanAngeloff/php.vim'
" Multiselector
"Plug 'terryma/vim-multiple-cursors'

"Plugin para comentar codigo
Plug 'preservim/nerdcommenter'
" Snippets
Plug 'honza/vim-snippets'
Plug 'universal-ctags/ctags'
"Tab bar como vscode
Plug 'preservim/tagbar'
"Close Tag

Plug 'tpope/vim-surround'
call plug#end()

" Enable theming support
"if (has("termguicolors"))
" set termguicolors
"endif

" Theme
syntax enable
"colorscheme dracula
colorscheme onedark

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

nnoremap <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"Activacion de thema onedark
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"Fin de activacion de colores de onedark

"Configuracion de algunos plugins
let g:airline#extensions#tabline#enabled = 1
let g:coc_global_extensions=['coc-json' , 'coc-tsserver' , 'coc-emmet' , 'coc-tslint' , 'coc-prettier','coc-omnisharp','coc-css','coc-java','coc-phpls']
set updatetime=100
let g:prettier#autoformat = 1

" Syntax de php pon tu version de php
     
"colorscheme onedark
"let g:gruvbox_contrast_dark="hard"
"let NERDTreeQuitOnOpen=1 " Cierra NERDTREE cuando seleccione un archivo
let mapleader=" "
let g:mustache_abbreviations = 1
"Short Code
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>qr :q!<CR> 
" airline bufer
map <c-i> :bnext<CR>
map <C-w> :bdelete!<CR>
let g:gitgutter_map_keys = 0
" Hace que coc me de autoimportacion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"Configuracion extra para coc 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')
"Auto Fomarteo con prettier   
augroup prettier
    autocmd!
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.php,*.cs,*.java  PrettierAsync
augroup END

"view rawinit.vim maximopeoficiales ❤ by GitHub
