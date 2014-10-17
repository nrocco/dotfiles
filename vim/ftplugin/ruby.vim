" ---------------------------------------------------------------
" PLUGIN: TODO
" Check chef syntax with the <leader>+l
" ---------------------------------------------------------------
  noremap <leader>l     :Foodcritic<CR>

  let g:vimrubocop_keymap = 0
  nmap    <Leader>r     :RuboCop<CR>
" ---------------------------------------------------------------

" Set tabs to 2 spaces for ruby files
  setlocal sw=2 sts=2 et
