" format an xml document using the `xmllint` cli program
  map <leader>l       :silent 1,$!xmllint --format --recover - 2>/dev/null<CR>
