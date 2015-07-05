alias running='f() { ps auwx | grep "$@" | grep -v grep }; f'

# Password generator
alias gen_pass='f() { LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c${1:-20}; echo;}; f'

# Set preferred default editor
export EDITOR=vim
export VISUAL=vim

# Set pythonrc file path
export PYTHONSTARTUP=$HOME/.pythonrc.py

# Make sure mtr has transparent background: https://github.com/traviscross/mtr/issues/72
alias mtr='TERM=linux-m mtr'

alias whatismyip='curl ifconfig.co'
alias jsonfmt='python -mjson.tool'
alias drop_caches='sudo su -c "sync; echo 3 > /proc/sys/vm/drop_caches"'

alias vim='vim -p'
alias vi='vim'
alias jq='jq --raw-output'

zstyle ':vcs_info:*' stagedstr ':+'
zstyle ':vcs_info:*' unstagedstr ':*'
