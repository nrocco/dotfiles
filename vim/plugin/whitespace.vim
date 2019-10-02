" https://vim.fandom.com/wiki/Highlight_unwanted_spaces

if exists("g:did_plugin_white_space")
  finish
endif
let g:did_plugin_white_space = 1

set listchars=tab:»·,trail:·
set list
hi SpecialKey ctermbg=red ctermfg=red guibg=red guifg=red
