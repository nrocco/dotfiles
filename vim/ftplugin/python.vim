" Set tabs to 4 spaces
  setlocal sw=4 sts=4 et

" run current python code
  noremap <C-b> :!python %<CR>

" Set smart indenting
  set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Highlight lines that are too long
  set colorcolumn=80
  highlight ColorColumn ctermbg=Black guibg=Black

" Highlight end of line whitespace and literal tab characters.
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$\|\t/


  set tags+=.git/tags_vendors




" Get the current function the cursor is focussed on and run it through phpunit.
function! PyunitTestFunction()
    let l:pyFuncDef = getline(search('^\s*def\s\+\(test[^(]\+\)\s*.*$', 'nbW'))
    let l:pyFunc = substitute(l:pyFuncDef, '^\s*def\s\+\([^(]\+\).*$', '\1', '')

    if empty(l:pyFunc)
        echomsg "Could not find a test function under the cursor"
        return
    endif

    let l:pyClassDef = getline(search('^\s*class\s\+\([^(]\+\).*$', 'nbW'))
    let l:pyClass = substitute(l:pyClassDef, '^\s*class\s\+\([^(]\+\).*$', '\1', '')

    let l:pyModule = substitute(substitute(@%, ".py$", "", ""), "/", ".", "g")

    silent !clear
    execute '!env/bin/python manage.py test '.l:pyModule.".".l:pyClass.".".l:pyFunc
endfunction


" Define commands for easy access
command! PyunitTestFunction call PyunitTestFunction()


" Define keyboard mapping for even easier easy access
map <Leader>t :call PyunitTestFunction()<CR>
