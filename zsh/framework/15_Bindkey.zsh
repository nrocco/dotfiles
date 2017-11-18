# Adds sudo to the line
run-with-sudo() { [[ $BUFFER != sudo\ * ]] && LBUFFER="sudo $LBUFFER" }
zle -N run-with-sudo

# Create a history completion widget and use it as completion context
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history

# Show "waiting dots" while something tab-completes
expand-or-complete-with-dots() {
	echo -n "\e[31m...\e[0m"
	zle expand-or-complete
	zle redisplay
}
zle -N expand-or-complete-with-dots

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

# [Esc-w] - Kill from the cursor to the mark
bindkey '\ew' kill-region

# [Ctrl-r] - Search backward incrementally for a specified string.
bindkey '^r' history-incremental-search-backward

# [Up-Arrow] - Up a line of history
bindkey "${terminfo[kcuu1]}" up-line-or-history

# [Down-Arrow] - Down a line of history
bindkey "${terminfo[kcud1]}" down-line-or-history

# start typing + [PageUp] - fuzzy find history forward
#bindkey "${terminfo[kpp]}" up-line-or-search
bindkey "${terminfo[kpp]}" history-beginning-search-backward

# start typing + [PageDown] - fuzzy find history backward
#bindkey "${terminfo[knp]}" down-line-or-search
bindkey "${terminfo[knp]}" history-beginning-search-forward

# [Home] - Go to beginning of line
bindkey "${terminfo[khome]}" beginning-of-line

# [End] - Go to end of line
bindkey "${terminfo[kend]}" end-of-line

# [Insert] - Quoted insert
bindkey "${terminfo[kich1]}" quoted-insert

# [Space] - do history expansion
bindkey ' ' magic-space

# [Ctrl|Alt-RightArrow] - move forward one word
# bindkey '\C-[Oc' forward-word
bindkey '\e\e[C' forward-word

# [Ctrl|Alt-LeftArrow] - move backward one word
# bindkey '\C-[Od' backward-word
bindkey '\e\e[D' backward-word

# [Shift-Tab] - move through the completion menu backwards
bindkey "${terminfo[kcbt]}" reverse-menu-complete

# [Backspace] - delete backward
bindkey '^?' backward-delete-char

# [Delete] - delete forward
bindkey "${terminfo[kdch1]}" delete-char

# [Ctrl-X, Ctrl-S] Add sudo to current command
bindkey '\C-x\C-s' run-with-sudo

# [Ctrl-X, Ctrl-X] Complete word from history with menu
bindkey '\C-X\C-X' hist-complete

# Complete command with waiting-dots
bindkey '^I' expand-or-complete-with-dots

# File rename magick
bindkey '^[m' copy-prev-shell-word

# Disable flow control
stty -ixon -ixoff
