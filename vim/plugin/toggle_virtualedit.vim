function! RunToggleVirtualEdit()
  if &virtualedit =~ 'all'
    echomsg 'turn virtualedit off now'
    set virtualedit=
  else
    echomsg 'turn virtualedit on now'
    set virtualedit=all
  endif
endfunction

command! ToggleVirtualEdit call RunToggleVirtualEdit()

nmap  ,v  :ToggleVirtualEdit<CR>
