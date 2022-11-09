" set nocompatible                  " Turn off compatible with vi.

"set number                        " Show line numbers.
" set number relativenumber
" set ruler                         " Show cursor position.
" set autoindent                    " autoindent on return/enter

" tab and space
" set tabstop=2                     " space 2 "
" set softtabstop=2
" set shiftwidth=2
" set expandtab                     " Use space instead of tab"
" set showtabline=2                 " show file name on top

"[tab] new / vnew windows location
" set splitbelow
" set splitright

" Search
" set hlsearch                      " highlight search word
" set incsearch                     "
" set ignorecase                    "
" set smartcase

"
" set wrap
" set linebreak

" scroll
" set cursorline
" set scrolloff=5                   " show more

" other
" set showcmd
" set noshowmode
" set clipboard=unnamed            " clipboard from outside (not in vim)
" set noswapfile
" set backspace=indent,eol,start   " backspace work on insert mode

" color
" syntax enable                     " Turn on syntax highlighting.
" set t_Co=256
" colorscheme hybrid

" file type
" filetype on
" filetype indent on
" filetype plugin on
"
" spell & set filetype
" autocmd BufRead,BufNewFile *.rb setlocal spell spelllang=en_us filetype=ruby
" autocmd BufRead,BufNewFile *.es6 setlocal spell spelllang=en_us filetype=javascript
" autocmd BufRead,BufNewFile *html.erb setlocal spell spelllang=en_us filetype=html
"
" Initialize plugin system
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
" 看到 git 版本資訊
Plug 'Xuyuanp/nerdtree-git-plugin'
" 自動補全括號的外掛，包括小括號，中括號，以及花括號
Plug 'jiangmiao/auto-pairs'
" Plug 'ctrlpvim/ctrlp.vim'
" search files
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'nathanaelkane/vim-indent-guides'

" Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
" slim
Plug 'slim-template/vim-slim'
" git
" <leader>s to display who code
Plug 'tpope/vim-fugitive'
" Plug 'zivyangll/git-blame.vim'

" for golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" for ruby rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
call plug#end()



" let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']

" fix snipMate waring
" let g:snipMate = { 'snippet_version': 1 }

" map key
" let mapleader = ","

" let g:mapleader = ","

" fixed ctags not working on Neovim
" set tags=tags

" lua require'nvim_lsp'.solargraph.setup{}
" lua require'lspconfig'.solargraph.setup{}

lua << EOF
require'configs'
EOF
