# Create a history completion widget and use it as completion context
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history

# Load terminfo
zmodload zsh/terminfo

# To be able to access menuselect keymap
zmodload zsh/complist

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init() {
        echoti smkx
    }
    function zle-line-finish() {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

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

# Disable flow control
stty -ixon -ixoff

# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
