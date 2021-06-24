# FZF Configuration
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--bind 'ctrl-f:reload($FZF_DEFAULT_COMMAND --no-ignore-vcs),ctrl-g:reload($FZF_DEFAULT_COMMAND)'"

# Docker configuration
export DOCKER_HIDE_LEGACY_COMMANDS=yes
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

if which direnv > /dev/null
then
  eval "$(direnv hook zsh)"
fi

if [ -d "${HOME}/bin" ]
then
    path=("${HOME}/bin" $path)
fi
