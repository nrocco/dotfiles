" Execute the current bash shell script
  map <C-b> :!bash %<CR>


" Set tabs to 4 spaces
  setlocal sw=4 sts=4 et


" Highlight end of line whitespace and literal tab characters.
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$\|\t/
