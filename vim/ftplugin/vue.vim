" Tell vim to syntax highlight from the start (multiple languages)
autocmd BufEnter *.vue syntax sync fromstart

" This variable prevents vim-vue from supporting every prepocessor language highlighting.
let g:vue_disable_pre_processors=1
