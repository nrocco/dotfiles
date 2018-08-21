export PAGER=less
export EDITOR=vim
export VISUAL=vim

# Allows to kill backward word path by path using ctrl+w
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Report timing statistics for commands that take more than this, in seconds
export REPORTTIME=3
export TIMEFMT="time: %U user %S system %P cpu %*E total  %J"

if which dircolors > /dev/null
then
    if [ -f "${0:h}/../nord-dircolors/src/dir_colors" ]
    then
        eval $(dircolors -b "${0:h}/../nord-dircolors/src/dir_colors")
    fi
fi
