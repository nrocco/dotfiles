export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=/usr/local/go

alias virt-install='docker container run --rm --interactive --tty --env "LIBVIRT_DEFAULT_URI=$LIBVIRT_DEFAULT_URI" --entrypoint= nrocco/virt-install:latest /app/virt-install'

function to_timestamp() {
    date -d "$1" -u +"%s"
}

function to_date() {
    date -d "@$1" -u
}

function vm() {
    if [[ -z $1 || -z $2 ]]
    then
        echo vm [name] [image]
        return 1
    fi

    virt-install \
        --name "${1}" \
        --ram 2048 \
        --import \
        --os-type generic \
        --network network=default,model=virtio \
        --boot hd \
        --graphics vnc \
        --noautoconsole \
        --disk "pool=default,size=50,backing_store=${2},backing_format=qcow2,format=qcow2"
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
