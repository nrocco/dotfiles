export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias dnsclear="sudo killall -HUP mDNSResponder"

function ssh {
    /usr/bin/ssh $@
}

function wireshark-remote {
    ssh "$@" "tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}

function wireshark-remote-sudo {
    ssh "$@" "sudo tcpdump -s0 -U -n -w - 'not port 22'" | wireshark -k -i -
}

# Complete them as ssh
compdef _ssh wireshark-remote=ssh
compdef _ssh wireshark-remote-sudo=ssh
