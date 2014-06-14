  set omnifunc=phpcomplete#CompletePHP

" Execute current php script
  noremap <C-b> :!php %<CR>


" ---------------------------------------------------------------
" GENERAL: PHP Settings
" ---------------------------------------------------------------
  let php_sql_query=1                             " Highlight sql in php strings
  let php_htmlInStrings=1                         " Highlight HTML in php strings
  let php_noShortTags=1                           " Disable PHP Short Tags
  let g:PHP_vintage_case_default_indent=1         " Fix case/break indentation

  set keywordprg=pman
" ---------------------------------------------------------------


" Highlight end of line whitespace and literal tab characters.
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$\|\t/


" ---------------------------------------------------------------
" PLUGIN: vim-php-insert-use statements
" ---------------------------------------------------------------
  imap <buffer> <leader>m   <C-O>:call PhpInsertUse()<CR>
  map <buffer> <leader>m    :call PhpInsertUse()<CR>
" ---------------------------------------------------------------


" ---------------------------------------------------------------
" PLUGIN: vim-phpcs plugin
" ---------------------------------------------------------------
  noremap <leader>k     :Phpcs<CR>
" ---------------------------------------------------------------


" ---------------------------------------------------------------
" PLUGIN: vim-phplint plugin
" Check php syntax with the <leader>+l
" ---------------------------------------------------------------
  noremap <leader>l     :Phplint<CR>
" ---------------------------------------------------------------


" ---------------------------------------------------------------
" PLUGIN: vim-phpdoc plugin
" ---------------------------------------------------------------
  inoremap <buffer> <leader>d :call PhpDoc()<CR>
  nnoremap <buffer> <leader>d :call PhpDoc()<CR>
  vnoremap <buffer> <leader>d :call PhpDocRange()<CR>

  let g:pdv_cfg_ClassTags = ["author","version"]
" ---------------------------------------------------------------
