export PAGER=less
export EDITOR=vim
export VISUAL=vim

# Allows to kill backward word path by path using ctrl+w
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Report timing statistics for commands that take more than this, in seconds
export REPORTTIME=5
export TIMEFMT="time: %U user %S system %P cpu %*E total  %J"

if [[ -a "${ZSH_DOTDIR}/ls-colors/LS_COLORS" ]]; then
    which dircolors > /dev/null && eval $(dircolors -b "${ZSH_DOTDIR}/ls-colors/LS_COLORS" 2>/dev/null)
else
    which dircolors > /dev/null && eval $(dircolors -b)
fi
