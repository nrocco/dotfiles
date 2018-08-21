export FZF_DEFAULT_COMMAND='rg --files --color never --no-ignore --hidden --follow --glob "!.git/*" --glob "!build/coverage/*" --glob "!app/logs/*" --glob "!app/cache/*" --glob "!var/*"'
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
