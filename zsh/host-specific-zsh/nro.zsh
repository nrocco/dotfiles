source "/usr/share/fzf/key-bindings.zsh"

compdef baremetal=docker-compose

if [ -d "${HOME}/nro/bin" ]
then
    path=("${HOME}/nro/bin" $path)
fi

if [ -d "${HOME}/bin" ]
then
    path=("${HOME}/bin" $path)
fi

alias vimdiff='vim -d'
compdef vimdiff=vim

function plgrep {
    rg --ignore --ignore-vcs "$@" -- ~/nro/bundles/* ~/nro/frontend-layer/* ~/nro/process-layer/* ~/nro/python/* ~/nro/service-layer/*
}
compdef plgrep=rg

if [ -S "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock" ]
then
    unlink "$HOME/.ssh/agent_sock" 2>/dev/null
    ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
    export SSH_AUTH_SOCK="$HOME/.ssh/agent_sock"
fi

if which tmux &> /dev/null
then
    precmd () {
        tmux rename-window "${PWD##/*/}"
    }

    if [[ -z "$TMUX" ]]
    then
        exec tmux att
    fi

    bindkey "\e[1~" beginning-of-line
    bindkey "\e[4~" end-of-line
fi
