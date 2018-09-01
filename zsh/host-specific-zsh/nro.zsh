source "/usr/share/fzf/key-bindings.zsh"

alias bma='docker-compose --file /home/nrocco/nro/docker-compose.yml'
alias redis-cli='docker container exec -i -t nro_redis_1 redis-cli'
alias vault='docker container exec -i -t nro_vault_1 vault'
alias cloudctl='sudo cloudctl'

path=("${HOME}/bin" ${path} "${HOME}/.composer/vendor/bin")

function plgrep {
    rg "$@" ~/www/bmp-api/src ~/www/dedicatedserver-api/src ~/www/emp-dashboard/src ~/www/nse-api/src ~/legacy/cis ~/bundles/*/src
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