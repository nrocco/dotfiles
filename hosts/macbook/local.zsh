autoload -Uz _notsio

alias ocomvpn='gpg -q --no-tty --decrypt ~/Dropbox/Configs/ocom.gpg | sudo openconnect --config ~/Dropbox/Configs/ocom.conf -- connect.ocom.com'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

local envfile="$HOME/.gnupg/gpg-agent.env"

if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --write-env-file "$envfile")"
fi

export GPG_AGENT_INFO  # the env file does not contain the export statement

function wireshark-remote {
    ssh "$@" "tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}

function wireshark-remote-sudo {
    ssh "$@" "sudo tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}

# Complete them as ssh
compdef _ssh wireshark-remote=ssh
