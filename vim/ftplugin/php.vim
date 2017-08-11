" Set tabs to 4 spaces
  setlocal sw=4 sts=4 et

" Execute current php script
  noremap <C-b> :!php %<CR>

" Some php options
  set omnifunc=phpcomplete#CompletePHP
  let php_sql_query=1                             " Highlight sql in php strings
  let php_htmlInStrings=1                         " Highlight HTML in php strings
  let php_noShortTags=1                           " Disable PHP Short Tags
  let g:PHP_vintage_case_default_indent=1         " Fix case/break indentation


" PLUGIN: vim-php-insert-use statements
  inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
  noremap  <Leader>u :call PhpInsertUse()<CR>
  inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
  noremap  <Leader>e :call PhpExpandClass()<CR>


" PLUGIN: vim-phpdoc plugin
  nnoremap <buffer> <leader>d :call PhpDoc()<CR>
  let g:pdv_cfg_ClassTags = ["author"]


" ctags for vendors are in their own file
  set tags+=.git/tags_vendors


" Sort all the use statements in the current file
  noremap <leader>g :0;/^use /;/^$/-1 sort u<CR>
