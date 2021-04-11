" ------------------------------------------------------------------------------------------------------------------------------
" Alternate between files
" ------------------------------------------------------------------------------------------------------------------------------

if exists("g:did_plugin_alternate")
  finish
endif

let g:did_plugin_alternate = 1

function! Alternate() abort
    if expand('%:t') =~ ".component.html"
        let file = expand('%:r') . ".ts"
    elseif expand('%:t') =~ ".component.ts"
        let file = expand('%:r') . ".html"
    elseif expand('%:e') ==# "php"
        if expand('%:r')[-4:] ==# "Test"
            let file = "src" . expand('%:r')[5:-5] . ".php"
        else
            let file = "tests" . expand('%:r')[3:] . "Test.php"
        endif
    elseif expand('%:e') ==# "go"
        if expand('%:r')[-5:] ==# "_test"
            let file = expand('%:r')[:-6] . ".go"
        else
            let file = expand('%:r') . "_test.go"
        endif
    else
        echo "Could not find alternate file"
        return
    endif

    execute "edit" file
endfunction

nnoremap <leader>a :call Alternate()<CR>
