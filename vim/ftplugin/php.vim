" ---------------------------------------------------------------
" GENERAL: PHP Settings
" ---------------------------------------------------------------
  set omnifunc=phpcomplete#CompletePHP

  " Execute current php script
  noremap <C-b> :!php %<CR>

  let php_sql_query=1                             " Highlight sql in php strings
  let php_htmlInStrings=1                         " Highlight HTML in php strings
  let php_noShortTags=1                           " Disable PHP Short Tags
  let g:PHP_vintage_case_default_indent=1         " Fix case/break indentation

  set keywordprg=pman

  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$\|\t/
" ---------------------------------------------------------------


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
  nnoremap <buffer> <leader>d :call PhpDoc()<CR>

  let g:pdv_cfg_ClassTags = ["author"]
" ---------------------------------------------------------------
