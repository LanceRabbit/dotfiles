local augroup = require('core.utils').augroup


-- show cursor line only in active window
augroup('SetCursorLine', {
  {
    event = { 'WinEnter' },
    pattern = { '*' },
    command = [[setlocal cursorline]]
  },
  {
    event = { 'WinLeave' },
    pattern = { '*' },
    command = [[setlocal nocursorline]]
  }
})

-- delete the space at the end of lines before writing from buffer to file.
augroup('CleanSpace', {
  {
    event = { 'BufWritePre' },
    pattern = { '*' },
    command = [[:%s/\s\+$//e]]
  }
})

augroup('Spell', {
  {
    event = { 'BufRead', 'BufNewFile' },
    pattern = { '*' },
    command = [[setlocal spell spelllang=en_us]]
  }
})

augroup('Filetype', {
  {
    event = { 'BufRead', 'BufNewFile' },
    pattern = { '*.rb' },
    command = [[set filetype=ruby]]
  },
  {
    event = { 'BufRead', 'BufNewFile' },
    pattern = { '*.html.erb' },
    command = [[set filetype=html]]
  },
  {
    event = { 'BufRead', 'BufNewFile' },
    pattern = { '*.es6' },
    command = [[set filetype=javascript]]
  },
  {
    event = { 'BufRead', 'BufNewFile' },
    pattern = { '*.slim' },
    command = [[set filetype=slim]]
  },
})

augroup('Golang', {
  {
    event = { 'BufRead', 'BufNewFile' },
    pattern = { '*.go' },
    command = [[setlocal noexpandtab tabstop=8 shiftwidth=8]]
  }
})
