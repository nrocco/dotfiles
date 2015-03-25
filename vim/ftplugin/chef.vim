" Set tabs to 2 spaces
  setlocal sw=2 sts=2 et

" ---------------------------------------------------------------
" Syntax checks
" ---------------------------------------------------------------
  noremap <leader>l     :Foodcritic<CR>

  let g:vimrubocop_keymap = 0
  nmap    <Leader>r     :RuboCop<CR>
" ---------------------------------------------------------------
