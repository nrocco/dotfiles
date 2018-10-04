export PAGER=less
export EDITOR=vim
export VISUAL=vim

# Allows to kill backward word path by path using ctrl+w
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

if which dircolors > /dev/null
then
    if [ -f "${0:h}/../nord-dircolors/src/dir_colors" ]
    then
        eval $(dircolors -b "${0:h}/../nord-dircolors/src/dir_colors")
    else
        eval $(dircolors -b)
    fi
fi
