export FZF_DEFAULT_COMMAND='rg --files --color never --no-ignore --hidden --follow --glob "!.git/*" --glob "!build/coverage/*" --glob "!app/logs/*" --glob "!app/cache/*"'
export DOCKER_HIDE_LEGACY_COMMANDS=yes

compdef rgit=git

if [ -f "$HOME/.zshrclocal" ]; then
    source "$HOME/.zshrclocal"
fi
