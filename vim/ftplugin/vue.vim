" Tell vim to syntax highlight from the start (multiple languages)
autocmd BufEnter *.vue syntax sync minlines=200

" leafOfTree/vim-vue-plugin: Set global variable to 1 to enable or 0 to disable
" let g:vim_vue_plugin_load_full_syntax = 1

" This variable prevents vim-vue from supporting every prepocessor language highlighting.
let g:vue_disable_pre_processors=1

" Use 2 spaces for indentation
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
