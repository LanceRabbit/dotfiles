nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
" clear search
nnoremap <C-c> :noh<CR>

" 視窗切換時候顯示/隱藏游標底線
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" 存檔時自動把行末多餘的空白刪除
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufRead,BufNewFile *.rb set filetype=ruby
