alias redis-server='redis-server /usr/local/etc/redis.conf'

function json {
    if [ $# -eq 0 ]
    then
        set -- "."
    fi
    jq --raw-output "$@"
}

alias ls='ls -G'
alias ll='ls -lh'
alias vim='vim -p'

autoload -Uz _notsio
autoload -Uz _consume

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
