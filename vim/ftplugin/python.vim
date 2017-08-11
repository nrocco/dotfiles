" Set tabs to 4 spaces
  setlocal sw=4 sts=4 et

" run current python code
  noremap <C-b> :!python %<CR>

" Set smart indenting
  set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

  set tags+=.git/tags_vendors
