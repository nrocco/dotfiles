host_zsh=$(hostname -s | tr '[A-Z]' '[a-z]')

if [ -f "${0:h}/../host-specific-zsh/${host_zsh}.zsh" ]
then
    source "${0:h}/../host-specific-zsh/${host_zsh}.zsh"
fi
