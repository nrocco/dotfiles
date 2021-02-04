" Autoclose the quickfix window
" autocmd BufEnter <buffer> nested if winnr('$') < 2 | bwipeout | endif

" Do not highlight special characters
setlocal listchars=tab:\ \ 

set nobuflisted
setlocal norelativenumber
setlocal number
setlocal nowrap
