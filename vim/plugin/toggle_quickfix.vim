" ------------------------------------------------------------------------------------------------------------------------------
" Inspiration taken from https://github.com/romainl/vim-qf
" ------------------------------------------------------------------------------------------------------------------------------

if exists("g:did_plugin_toggle_quickfix")
  finish
endif

let g:did_plugin_toggle_quickfix = 1

function! QuickfixToggle() abort
    for winnum in range(1, winnr('$'))
        if getwinvar(winnum, "&filetype") == "qf"
            cclose
            return
        endif
    endfor
    cwindow
endfunction

function! QuickfixClear() abort
    call setqflist([])
    cclose
endfunction

nnoremap <leader>c :call QuickfixToggle()<CR>
nnoremap <leader>C :call QuickfixClear()<CR>
