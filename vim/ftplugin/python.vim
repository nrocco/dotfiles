
"" https://dev.launchpad.net/UltimateVimPythonSetup

" run current python code
  noremap <C-b> :!python %<CR>

" run nosetests
  noremap <leader>t   :!clear;make test<CR>

" Check python syntax using <leader> + l
  noremap <leader>l   :!python -m py_compile %<CR>

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
  set omnifunc=pythoncomplete#Complete

" Disable more syntax highlighting.
  let python_highlight_all = 0

" Wrap at 72 chars for comments.
  set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" Set smart indenting
  set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Highlight lines that are too long
  match ErrorMsg /\%>80v.\+/

" Highlight end of line whitespace and literal tab characters.
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$\|\t/

  highlight pythonRun ctermfg=red
