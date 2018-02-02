export GIT_AUTHOR_EMAIL=n.dirocco@global.leaseweb.com
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

alias vault='docker exec -it vault vault'

path=(
    "${HOME}/bin"
    "${HOME}/.composer/vendor/bin"
    $path
)

function plgrep {
    grep -R --exclude-dir=.git --exclude-dir=vendor --exclude-dir=logs --exclude-dir=build --exclude-dir=cache "$@" \
        ~/www/bmp-api \
        ~/www/nse-api \
        ~/www/dedicatedserver-api \
        ~/www/deploy-api \
        ~/bundles/lswauditbundle \
        ~/bundles/lswprocesslayerbundle \
        ~/bundles/lswrestapibundle \
        ~/bundles/lswqueuebundle \
        ~/bundles/lswauditbundle \
        ~/bundles/lswservicedescriptionsbundle
}
compdef _grep plgrep=grep

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
