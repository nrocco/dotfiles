# Load terminfo
zmodload zsh/terminfo

# To be able to access menuselect keymap
zmodload zsh/complist

# Use emacs key bindings
bindkey -e

# [Up-Arrow] - Up a line of history
bindkey "${terminfo[kcuu1]}" up-line-or-history

# [Down-Arrow] - Down a line of history
bindkey "${terminfo[kcud1]}" down-line-or-history

# start typing + [PageUp] - fuzzy find history forward
bindkey "${terminfo[kpp]}" history-beginning-search-backward

# start typing + [PageDown] - fuzzy find history backward
bindkey "${terminfo[knp]}" history-beginning-search-forward

# [Home] - Go to beginning of line
bindkey "${terminfo[khome]}" beginning-of-line

# [End] - Go to end of line
bindkey "${terminfo[kend]}" end-of-line

# [Insert] - Quoted insert
bindkey "${terminfo[kich1]}" quoted-insert

# [Space] - do history expansion
bindkey ' ' magic-space

# [Shift-Tab] - move through the completion menu backwards
bindkey "${terminfo[kcbt]}" reverse-menu-complete
