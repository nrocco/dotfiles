alias tail_all='tail -f app/logs/* /var/log/apache2/*.log'
alias ack=ack-grep

if [ -S "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock" ]
then
    unlink "$HOME/.ssh/agent_sock" 2>/dev/null
    ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
    export SSH_AUTH_SOCK="$HOME/.ssh/agent_sock"
fi

if which tmux &> /dev/null
then
    if [[ -z "$TMUX" ]]
    then
        if ! tmux has-session -t default 2>/dev/null
        then
            tmux new-session -d -s default
        fi

        exec tmux attach-session -t default
    fi
fi
