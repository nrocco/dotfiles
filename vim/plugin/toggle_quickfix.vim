" https://gist.github.com/suewonjp/c9bc75605d4ead232261b1cdc0ef4fb6

if exists("g:did_plugin_toggle_quickfix")
  finish
endif
let g:did_plugin_toggle_quickfix = 1

command! ToggleQuickfix call s:ToggleQuickfix()

function! s:ToggleQuickfix()
    let buffer_count_before = s:BufferCount()
    silent! cclose

    if s:BufferCount() == buffer_count_before
        execute "silent! botright copen"
    endif
endfunction

function! s:BufferCount() abort
    return len(filter(range(1, bufnr('$')), 'bufwinnr(v:val) != -1'))
endfunction
