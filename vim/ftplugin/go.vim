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

" Enable highlighting of variables that are the same
let g:go_auto_sameids = 0

" Auto import dependencies
let g:go_fmt_command = "goimports"

" Show type information in status line
let g:go_auto_type_info = 1
