" ------------------------------------------------------------------------------------------------------------------------------
" Buffer navigation
" ------------------------------------------------------------------------------------------------------------------------------

if exists("g:did_plugin_buffer_nav")
  finish
endif

let g:did_plugin_buffer_nav = 1

function! BufferByeAndWrite()
    :cclose
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        :wq
    else
        :write
        :bwipeout
    endif
endfunction

function! BufferBye()
    :cclose
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        :quit
    else
        :bwipeout
    endif
endfunction

function! BufferByeForce()
    :cclose
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        :quit!
    else
        :bwipeout!
    endif
endfunction

nnoremap <leader>n :enew<CR>
nnoremap <leader>e :edit<SPACE>
nnoremap <leader>w :write<CR>
nnoremap <leader>wq :call BufferByeAndWrite()<CR>
nnoremap <leader>q :call BufferBye()<CR>
nnoremap <leader>Q :call BufferByeForce()!<CR>
