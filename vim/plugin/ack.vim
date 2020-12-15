" use The Silver Searcher  
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


nnoremap FF :Ack<Space>

noremap <Leader>f :Ack <cword><cr>
