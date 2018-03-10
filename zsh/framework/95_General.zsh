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
