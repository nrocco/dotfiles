export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Prepare a multiline string for use in a chef data bag
function key_for_data_bag() {
    cat "$1" | sed s/$/\\\\n/ | tr -d '\n'
    echo
}

source "/usr/local/var/homebrew/linked/fzf/shell/completion.zsh"
source "/usr/local/var/homebrew/linked/fzf/shell/key-bindings.zsh"

alias nmap='sudo /usr/local/bin/nmap'
alias mtr='sudo /usr/local/sbin/mtr'
alias ping='sudo /sbin/ping'
alias traceroute='sudo /usr/sbin/traceroute'
