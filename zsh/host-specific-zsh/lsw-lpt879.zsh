export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=/usr/local/go

source "/usr/local/Cellar/fzf/0.17.5/shell/completion.zsh"
source "/usr/local/Cellar/fzf/0.17.5/shell/key-bindings.zsh"

alias nmap='sudo /usr/local/bin/nmap'
alias mtr='sudo /usr/local/sbin/mtr'
alias ping='sudo /sbin/ping'
alias traceroute='sudo /usr/sbin/traceroute'

path=("${HOME}/bin" ${path} "${HOME}/.composer/vendor/bin" "${GOPATH}/bin")

function chefgrep {
    rg --follow "$@" /Users/nrocco/Develop/chef-repo/cookbooks
}
compdef chefgrep=rg

function wireshark-remote {
    ssh "$@" "tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}
compdef wireshark-remote=ssh

function wireshark-remote-sudo {
    ssh "$@" "sudo tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}
compdef wireshark-remote-sudo=ssh
