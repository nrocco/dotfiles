" Keep an eye on:
" https://github.com/neovim/neovim/pull/1802

function! NotsioSave()
    " If this variable is not set, then there is nothing to save
    if !exists("g:notsio_id")
        return
    endif

    let l:filename=@%
    let l:notsio_output=system('notsio modify '.g:notsio_id.' '.l:filename)
    let l:notsio_list=split(l:notsio_output, "\n")

    if v:shell_error
        echoerr "something went wrong"
    else
        echomsg l:notsio_list[0]
    endif
endfunction


command! NotsioSave call NotsioSave()

" Call the NotsioSave() function everytime we save in vim
autocmd BufWritePost tmp*-notsio NotsioSave
