source "/usr/share/fzf/key-bindings.zsh"

# Enable buildkit
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# compdef baremetal=docker-compose

if [ -d "${HOME}/nro/bin" ]
then
    path=("${HOME}/nro/bin" $path)
fi

if [ -d "${HOME}/bin" ]
then
    path=("${HOME}/bin" $path)
fi

function lswrg {
    rg --ignore --ignore-vcs "$@" -- ~/nro/bundles/* ~/nro/frontend-layer/* ~/nro/process-layer/* ~/nro/python/* ~/nro/service-layer/*
}
compdef lswrg=rg

# Fix key bindings in tmux
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
