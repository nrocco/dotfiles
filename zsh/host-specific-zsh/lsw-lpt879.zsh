export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=/usr/local/go

source "/usr/local/Cellar/fzf/0.17.4/shell/completion.zsh"
source "/usr/local/Cellar/fzf/0.17.4/shell/key-bindings.zsh"

alias lswcli='python3 -m lswcli'
alias mtr='sudo /usr/local/sbin/mtr'
alias ping='sudo /sbin/ping'
alias traceroute='sudo /usr/sbin/traceroute'

path=("${HOME}/bin" ${path} "${HOME}/.composer/vendor/bin")

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

alias vpn='gpg --decrypt ~/.openconnect-password | sudo openconnect --config ~/.openconnect.conf connect.ocom.com'
