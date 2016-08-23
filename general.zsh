alias running='f() { ps auwx | grep "$@" | grep -v grep }; f'

# Password generator
alias gen_pass='f() { LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c${1:-20}; echo;}; f'

# Set preferred default editor
export EDITOR=vim
export VISUAL=vim

alias whatismyip='curl ifconfig.co'
alias jsonfmt='python -mjson.tool'
alias drop_caches='sudo su -c "sync; echo 3 > /proc/sys/vm/drop_caches"'

alias vim='vim -p'
alias vi='vim'

if which jq > /dev/null
then
    alias jq='jq --raw-output'

    function json {
        if [ $# -eq 0 ]
        then
            set -- "."
        fi
        jq "$@"
    }
fi

zstyle ':vcs_info:*' stagedstr ':+'
zstyle ':vcs_info:*' unstagedstr ':*'
