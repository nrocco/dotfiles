
autocmd BufEnter <buffer> nested if winnr('$') < 2 | q | endif
