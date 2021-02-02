
autocmd BufEnter <buffer> nested if winnr('$') < 2 | q | endif

" Do not highlight special characters
setlocal listchars=tab:\ \ 
