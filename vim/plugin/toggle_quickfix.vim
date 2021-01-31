" ------------------------------------------------------------------------------------------------------------------------------
" Inspiration taken from https://github.com/romainl/vim-qf
" ------------------------------------------------------------------------------------------------------------------------------

if exists("g:did_plugin_toggle_quickfix")
  finish
endif

let g:did_plugin_toggle_quickfix = 1

function! ToggleQuickfix() abort
    for winnum in range(1, winnr('$'))
        if getwinvar(winnum, "&filetype") == "qf"
            cexpr []
            cclose
            return
        endif
    endfor
    copen
endfunction

nnoremap <leader>c :call ToggleQuickfix()<CR>
