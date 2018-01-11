export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/go
export DOCKER_HIDE_LEGACY_COMMANDS=yes
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

alias dnsclear="sudo killall -HUP mDNSResponder"
alias lswcli='python3 -m lswcli'

function chefgrep {
    grep -R --exclude-dir=.git "$@" /Users/nrocco/Develop/chef-repo/cookbooks
}
compdef _grep chefgrep=grep

function wireshark-remote {
    ssh "$@" "tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}
compdef _ssh wireshark-remote=ssh

function wireshark-remote-sudo {
    ssh "$@" "sudo tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}
compdef _ssh wireshark-remote-sudo=ssh
