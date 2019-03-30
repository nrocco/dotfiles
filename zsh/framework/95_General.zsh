export FZF_DEFAULT_COMMAND='fd --color never --no-ignore-vcs --follow --type file --exclude ".git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export DOCKER_HIDE_LEGACY_COMMANDS=yes

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
