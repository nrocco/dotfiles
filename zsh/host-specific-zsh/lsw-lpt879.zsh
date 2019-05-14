export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=/usr/local/go

source "/usr/local/Cellar/fzf/0.18.0/shell/completion.zsh"
source "/usr/local/Cellar/fzf/0.18.0/shell/key-bindings.zsh"

alias nmap='sudo /usr/local/bin/nmap'
alias mtr='sudo /usr/local/sbin/mtr'
alias ping='sudo /sbin/ping'
alias traceroute='sudo /usr/sbin/traceroute'

path=("${HOME}/bin" ${path} "${HOME}/.composer/vendor/bin" "${GOPATH}/bin")

compdef wireshark-remote=ssh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
