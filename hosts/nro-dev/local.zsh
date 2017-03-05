alias tail_all='tail -fn0 app/logs/* /var/log/apache2/*.log'
alias php-xdebug='php -d "zend_extension=/usr/lib/php5/20090626/xdebug.so"'

php-coverage() {
    SYMFONY_DEPRECATIONS_HELPER=weak php-xdebug vendor/phpunit/phpunit/phpunit --coverage-html "/var/www/io.nro.devleaseweb.com/coverage/$(basename $PWD)" "$@"
}

if [ -S "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock" ]
then
    unlink "$HOME/.ssh/agent_sock" 2>/dev/null
    ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
    export SSH_AUTH_SOCK="$HOME/.ssh/agent_sock"
fi

precmd () {
    printf "\033]2;`[[ ${PWD} == ${HOME} ]] && echo '~' || basename ${PWD}`\033\\"
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
