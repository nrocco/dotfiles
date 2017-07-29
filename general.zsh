# Password generator
alias gen_pass='f() { LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c${1:-20}; echo;}; f'

# Set preferred default editor
export EDITOR=vim
export VISUAL=vim

alias jsonfmt='python -mjson.tool'
alias drop_caches='sudo su -c "sync; echo 3 > /proc/sys/vm/drop_caches"'

# A command-line fuzzy finder written in Go
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add
if which direnv > /dev/null
then
  eval "$(direnv hook zsh)"
fi

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
