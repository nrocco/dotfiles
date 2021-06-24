# Easy dir changing
alias ..='cd ..; ls'
alias ...='cd ../..; ls'
alias ....='cd ../../..; ls'

# No spelling correction
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

alias vi=vim

# Adding color to our commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Some short hand commands
alias l='ls -lF'
alias ll='ls -lh --time-style=long-iso'
alias lt='ll -rt'
alias vihosts="sudo vim /etc/hosts"

# Ssh without KnownHosts
alias sshc='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias scpc='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# easy access to docker compose
alias dc='docker compose'

# Find the vendor of a given mac address
function mac_to_vendor() {
    curl "https://api.macvendors.com/${1}"; echo
}

# Convert a date to a UTC timestamp
function to_timestamp() {
    date -d "$1" -u +"%s"
}

# Convert a timestamp to a UTC date
function to_date() {
    date -d "@$1" -u
}
