export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=~/go
export DOCKER_HIDE_LEGACY_COMMANDS=yes
export FZF_DEFAULT_COMMAND='rg --files --color never --no-ignore --hidden --follow --glob "!.git/*"'

source "/usr/local/Cellar/fzf/0.17.4/shell/completion.zsh"
source "/usr/local/Cellar/fzf/0.17.4/shell/key-bindings.zsh"

alias lswcli='python3 -m lswcli'

path=(
    "${HOME}/bin"
    $path
    "${HOME}/.composer/vendor/bin"
    "${GOPATH}/bin"
)

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

alias appearin='open -n -a Chromium --args --no-default-browser-check --disable-sync http://appear.in/bare-mentals'
alias vlan11='open -n -a Chromium --args --user-data-dir="/Users/nrocco/Library/Application Support/ChromiumVlan11" --no-default-browser-check --ignore-certificate-errors --disable-sync --proxy-server="socks://10.11.11.3:1080"'
alias vlan33='open -n -a Chromium --args --user-data-dir="/Users/nrocco/Library/Application Support/ChromiumVlan33" --no-default-browser-check --ignore-certificate-errors --disable-sync --proxy-server="socks://10.11.33.3:1080"'
alias vpn='gpg --decrypt ~/.openconnect-password | sudo openconnect --config ~/.openconnect.conf connect.ocom.com'
