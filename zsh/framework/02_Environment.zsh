export PAGER=less
export EDITOR=vim
export VISUAL=vim
export CLICOLOR=1

# Allows to kill backward word path by path using ctrl+w
export WORDCHARS='*?_-[]~&;!#$%^(){}<>'

if which dircolors > /dev/null
then
    eval $(dircolors -b)
fi
