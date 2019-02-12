" Some php options
  set omnifunc=phpcomplete#CompletePHP
  let php_noShortTags=1                           " Disable PHP Short Tags
  let g:PHP_vintage_case_default_indent=1         " Fix case/break indentation

" PLUGIN: vim-php-insert-use statements
  inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
  noremap  <Leader>u :call PhpInsertUse()<CR>
  inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
  noremap  <Leader>e :call PhpExpandClass()<CR>

" Sort all the use statements in the current file
  inoremap <Leader>g <Esc>:call PhpSortUse()<CR>
  noremap <Leader>g :call PhpSortUse()<CR>

  let g:php_namespace_sort_after_insert = 1

" Run php -l
  noremap <leader>l :Phplint<CR>

" PLUGIN: arnaud-lb/vim-php-namespace
  let g:php_namespace_sort_after_insert = 1
