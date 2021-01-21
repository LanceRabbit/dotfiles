nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
" clear search
nnoremap <C-c> :noh<CR>
" jump to the end of line
nnoremap 11 <S-$>
" jump to the head of line
nnoremap 22 <S-^>
" copy all line
nnoremap ca gg"*yG<CR>

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
