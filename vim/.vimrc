set nocompatible                  " Turn off compatible with vi.

"set number                        " Show line numbers.
set relativenumber
set ruler                         " Show cursor position.

set autoindent                    " autoindent on return/enter

" tab and space
set tabstop=2                     " space 2 "
set softtabstop=2
set shiftwidth=2
set expandtab                     " Use space instead of tab"
set showtabline=2                 " show file name on top

"[tab] new / vnew windows location
set splitbelow
set splitright

" Search
set hlsearch                      " highlight search word
set incsearch                     "
set ignorecase                    "
set smartcase

"
set wrap
set linebreak

" scroll
set cursorline
set scrolloff=5                   " show more

" other
set showcmd
set noshowmode
set cursorline
set clipboard=unnamed            " clipboard from outside (not in vim)
set noswapfile
set backspace=indent,eol,start   " backspace work on insert mode



" color
syntax enable                     " Turn on syntax highlighting.
set t_Co=256
colorscheme hybrid

" file type
filetype on
filetype indent on
filetype plugin on

" Initialize plugin system
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
" slim
Plug 'slim-template/vim-slim'
" git
" Plug 'tpope/vim-fugitive'

Plug 'zivyangll/git-blame.vim'

" for ruby rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
call plug#end()


" map key
let mapleader = ","

let g:mapleader = ","
