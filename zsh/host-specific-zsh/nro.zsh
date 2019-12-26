source "/usr/share/fzf/key-bindings.zsh"

alias bma='docker-compose --file /home/nrocco/nro/docker-compose.yml --file /home/nrocco/nro/docker-compose.override.yml'
compdef bma=docker-compose

alias redis-cli='bma exec redis redis-cli'
alias vault='bma exec vault vault'

if [ -d "${HOME}/.composer/vendor/bin" ]
then
    path=($path "${HOME}/.composer/vendor/bin")
fi

if [ -d "${GOPATH}/bin" ]
then
    path=($path "${GOPATH}/bin")
fi

alias vimdiff='vim -d'
compdef vimdiff=vim

function plgrep {
    rg --no-hidden --ignore --ignore-vcs "$@" -- ~/nro/data/{bmp-api,bmusage-api,dedicatedserver-api,emp-dashboard,nse-api} ~/bundles/{lswauditbundle,lswguzzlemockpluginbundle,lswprocesslayerbundle,lswqueuebundle,lswrestapibundle,lswservicedescriptionsbundle}
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
        if ! tmux -u has-session -t default 2>/dev/null
        then
            tmux -u new-session -d -s default
        fi

        exec tmux -u attach-session -t default
    fi

    bindkey "\e[1~" beginning-of-line
    bindkey "\e[4~" end-of-line
fi
