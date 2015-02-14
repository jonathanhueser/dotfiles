filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'bling/vim-airline'

filetype plugin indent on
syntax enable

set nocompatible
set showcmd
set showmode
set autoindent
set backspace=indent,eol,start
set hidden
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set incsearch
set hlsearch
set number
set ruler
set wrap
set scrolloff=3
set winwidth=79
set colorcolumn=80
set nobackup
set nowritebackup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set list
set listchars=tab:.\ ,eol:.
set laststatus=2
set history=10000
set showtabline=2
set visualbell
set clipboard=unnamed
set spell spelllang=en_us

let mapleader = ","
imap <c-c> <esc>
nnoremap <cr> :nohlsearch<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nmap j gj
nmap k gk
noremap <left> :tabprevious<cr>
noremap <right> :tabnext<cr>
noremap <up> :bp<cr>
noremap <down> :bn<cr>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
nmap <leader>c :bd<cr>
nmap <leader>t :tabnew<cr>
nmap <leader>d :tabclose<cr>
nmap <leader>tm :tabmove

au BufReadPost *.hogan set syntax=html
au FileType tex setlocal nocursorline
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"autocmd FileType tex :NoMatchParen

set t_Co=256
set background=dark
colorscheme solarized

"let g:solarized_termcolors=256
"colorscheme lucius
"LuciusWhite
"LuciusDark
"let g:lucius_style = 'light'
"let g:lucius_style = 'dark'
"let g:lucius_contrast = 'normal'
"let g:lucius_contrast_bg = 'normal'
"let g:lucius_use_bold = 1
"let g:lucius_use_underline = 1

let g:airline_powerline_fonts=1
