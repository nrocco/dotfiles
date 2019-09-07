" https://vim.fandom.com/wiki/Highlight_unwanted_spaces

if exists("g:did_plugin_white_space")
  finish
endif
let g:did_plugin_white_space = 1

highlight ExtraWhitespace ctermbg=124
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
