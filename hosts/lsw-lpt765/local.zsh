autoload -Uz _notsio

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias gateway="netstat -rnfinet | awk '/^default/ {print \$2}'"
alias dnsclear="sudo killall -HUP mDNSResponder"

local envfile="$HOME/.gnupg/gpg-agent.env"

if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --write-env-file "$envfile")"
fi

export GPG_AGENT_INFO  # the env file does not contain the export statement
export GPG_TTY=`tty`

function wireshark-remote {
    ssh "$@" "tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}

function wireshark-remote-sudo {
    ssh "$@" "sudo tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}

# Complete them as ssh
compdef _ssh wireshark-remote=ssh
