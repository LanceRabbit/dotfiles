" open file on new tab
" ref: https://github.com/preservim/nerdtree/issues/1058#issuecomment-557641780
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
" Ctrl + u open Tree
nnoremap <silent> <C-u> :NERDTreeToggle<Enter>
" UI: hidden TOP PRESS or HELP
let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2
" close NERDTree if no file opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

