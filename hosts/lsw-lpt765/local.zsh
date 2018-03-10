export PATH=~/bin:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/go
export DOCKER_HIDE_LEGACY_COMMANDS=yes
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

source "/usr/local/Cellar/fzf/0.17.3/shell/completion.zsh"
source "/usr/local/Cellar/fzf/0.17.3/shell/key-bindings.zsh"

alias dnsclear="sudo killall -HUP mDNSResponder"
alias lswcli='python3 -m lswcli'

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

function livereplica {
    curl --insecure -H 'Host: api.leaseweb.com' -H 'Content-Type: application/json' -H "Authorization: Bearer ${TOKEN}" https://10.11.11.98$@ | jq
}
