alias tail_all='tail -fn0 app/logs/* /var/log/apache2/*.log'

phpunit() {
    if [[ -f vendor/phpunit/phpunit/phpunit ]]; then
        local phpunit_bin=vendor/phpunit/phpunit/phpunit
    elif which phpunit &> /dev/null; then
        local phpunit_bin=phpunit
    else
        echo "No phpunit found"
        exit 1
    fi

    $phpunit_bin "$@"
}

phpcoverage() {
    SYMFONY_DEPRECATIONS_HELPER=weak phpunit --coverage-html "/var/www/io.nro.devleaseweb.com/coverage/$(basename $PWD)" "$@"
}

if [ -S "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock" ]
then
    unlink "$HOME/.ssh/agent_sock" 2>/dev/null
    ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
    export SSH_AUTH_SOCK="$HOME/.ssh/agent_sock"
fi

precmd () {
    tmux rename-window "${PWD##/*/}"
}

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
