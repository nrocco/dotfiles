if [ -d "${ZSH_DOTDIR}/syntax-highlighting" ]; then
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
	source "${ZSH_DOTDIR}/syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

ZSH_HIGHLIGHT_STYLES[cursor]='none'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='bg=blue'

ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=green,bold'

ZSH_HIGHLIGHT_STYLES[assign]='fg=cyan'

ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=yellow'

ZSH_HIGHLIGHT_STYLES[command]='bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='bold'

ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path]='bold'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta,bold'
