export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--bind 'ctrl-f:reload($FZF_DEFAULT_COMMAND --no-ignore-vcs),ctrl-g:reload($FZF_DEFAULT_COMMAND)'"
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

function shellcheck() {
    local script=$(realpath $1)
    docker container run --rm -v "${script}:${script}" -w "$(dirname $script)" docker.io/koalaman/shellcheck-alpine:latest shellcheck "${script}"
}
