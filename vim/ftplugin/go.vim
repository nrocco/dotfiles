" Configure indentation
setlocal noexpandtab

" Code highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" " Auto import dependencies
let g:go_fmt_command = "goimports"

" Run GoMetaLinters
  noremap <leader>l :GoMetaLinter! expand('%')<CR>
