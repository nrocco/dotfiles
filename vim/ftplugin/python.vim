" Set tabs to 4 spaces
  setlocal sw=4 sts=4 et

" run current python code
  noremap <C-b> :!python %<CR>

" Set smart indenting
  set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Highlight lines that are too long
  set colorcolumn=80
  highlight ColorColumn ctermbg=Black guibg=Black

" Highlight end of line whitespace and literal tab characters.
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$\|\t/
