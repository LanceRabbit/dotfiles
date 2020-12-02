set nocompatible                  " Turn off compatible with vi.

set number                        " Show line numbers.
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

set scrolloff=5                   " show more

" other
set showcmd
set cursorline
set clipboard=unnamed            " clipboard from outside (not in vim)
set noswapfile

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
Plug 'vim-ruby/vim-ruby'
call plug#end()