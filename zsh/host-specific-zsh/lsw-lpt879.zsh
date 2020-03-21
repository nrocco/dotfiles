export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=/usr/local/go

alias virt-install='docker container run --rm --interactive --tty --env "LIBVIRT_DEFAULT_URI=$LIBVIRT_DEFAULT_URI" --entrypoint= nrocco/virt-install:latest /app/virt-install'
alias magick='docker container run --rm -v "$PWD:$PWD" -w "$PWD" --entrypoint= nrocco/imagemagick:latest magick'

# Convert a date to a UTC timestamp
function to_timestamp() {
    date -d "$1" -u +"%s"
}

# Convert a timestamp to a UTC date
function to_date() {
    date -d "@$1" -u
}

# Prepare a multiline string for use in a chef databag
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

if [ -d "${HOME}/.composer/vendor/bin" ]
then
    path=($path "${HOME}/.composer/vendor/bin")
fi

if [ -d "${GOPATH}/bin" ]
then
    path=($path "${GOPATH}/bin")
fi

if [ -d "${HOME}/bin" ]
then
    path=("${HOME}/bin" $path)
fi

compdef wireshark-remote=ssh
