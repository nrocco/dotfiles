" Set tabs to 4 spaces
  setlocal sw=2 sts=2 et


" Highlight end of line whitespace and literal tab characters.
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$\|\t/
