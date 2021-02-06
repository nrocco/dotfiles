" Autoclose the quickfix window
" TODO autocmd BufEnter <buffer> nested if winnr('$') < 2 | bwipeout | endif

" Do not highlight special characters
" TODO sets listchars in all buffers of window setlocal listchars=tab:\ \ 

set nobuflisted
setlocal norelativenumber
setlocal number
setlocal nowrap
