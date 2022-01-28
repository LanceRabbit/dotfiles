nnoremap <S-l> :tabn<CR>
nnoremap <S-h> :tabp<CR>
" clear search
nnoremap <C-c> :noh<CR>
" jump to the end of line
nnoremap s] <S-$>
" jump to the head of line
nnoremap s[ <S-^>
" copy all line
nnoremap cal gg"*yG<CR>

" select block and remove
nnoremap rb vg_c
nnoremap sb vg_

nnoremap cp' vi'p

" add quote
" nnoremap '' ysiw'
nnoremap qs :silent! normal mpea'<Esc>bi'<Esc>`pl
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
vnoremap '' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap "" <Esc>`>a"<Esc>`<i"<Esc>

nnoremap nt :tabe<CR>
nnoremap vn :vnew<CR>
nnoremap hn :new<CR>

" remove quotes from a word
nnoremap dq :silent! normal mpeld bhd `ph<CR>

" comma then w writes and quits your file
nnoremap <leader>w :w!<Enter>
" similar here, comma then q quits without saving
nnoremap <leader>q :q!<Enter>

" change to normal mode
imap jj <esc>

vnoremap $ g_

nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l

" up and down line
nnoremap <S-U> ddkkp
nnoremap <S-D> ddp

" 隱藏行內文字
nnoremap zf zfip

" 視窗切換時候顯示/隱藏游標底線
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" 存檔時自動把行末多餘的空白刪除
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufRead,BufNewFile *.rb set filetype=ruby
