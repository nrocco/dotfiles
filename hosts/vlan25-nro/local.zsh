alias tail_all='tail -f app/logs/* /var/log/apache2/*.log'

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
