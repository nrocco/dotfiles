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

function wireshark-remote {
    local ARGS_FOR=ssh
    local SSH_ARGS=()
    local TCPDUMP_ARGS=("-s0" "-U" "-n" "-w -")

    for ARG in "$@"
    do
        if [[ "${ARG}" == "--" ]]
        then
            ARGS_FOR=tcpdump
            continue
        fi

        if [[ "${ARGS_FOR}" == "ssh" ]]
        then
            SSH_ARGS+=("${ARG}")
        elif [[ "${ARGS_FOR}" == "tcpdump" ]]
        then
            TCPDUMP_ARGS+=("${ARG}")
        fi
    done

    echo "Ssh args: ${SSH_ARGS[@]}"
    echo "Tcpdump args: ${TCPDUMP_ARGS[@]}"

    ssh ${SSH_ARGS[@]} tcpdump ${TCPDUMP_ARGS[@]} 'not tcp port 22' | wireshark -k -i -
}
compdef wireshark-remote=ssh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
