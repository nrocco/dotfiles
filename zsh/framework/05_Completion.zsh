autoload -Uz compinit

# Complete as much u can: https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Control-Functions
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions on
zstyle ':completion:*' glob on

# Auto rehash commands
# http://www.zsh.org/mla/users/2011/msg00531.html
zstyle ':completion:*' rehash true

# Activate color-completion(!)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# If there are more than 5 options allow selecting from a menu
zstyle ':completion:*' menu select=2

# Usually, on Unix systems, // is expanded to /. Prefer this behavior
zstyle ':completion:*' squeeze-slashes true

# Prefer completing for an option
zstyle ':completion:*' complete-options true

# Start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*' insert-unambiguous true

# Format on correction
zstyle ':completion:*:correct:*' original true

# Describe options in full
zstyle ':completion:*:options' description yes

# For all completions: show comments when present
zstyle ':completion:*' verbose yes

# Completion of .. directories
zstyle ':completion:*' special-dirs true

# Fuzzy match mistyped completions
zstyle ':completion:*:match:*' original only

# Fault tolerance (1 error on 3 characters)
zstyle ':completion:*:correct:::' max-errors 2 numeric
zstyle ':completion:*:approximate:*' max-errors 2 numeric

# Attempt to complete many parts at once
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' keep-prefix true tag-order all-expansions

# kill: advanced kill completion
zstyle ':completion::*:kill:*:*' command 'ps xf -U $USER -o pid,%cpu,cmd'
zstyle ':completion::*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'

# Host completion
[[ -r ~/.ssh/known_hosts ]]  && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[[ -r /etc/hosts ]]          && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
[[ -r ${HOME}/.ssh/config ]] && _ssh_config_hosts=(${=${${${${(@M)${(f)"$(<$HOME/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}) || _ssh_config_hosts=()
hosts=(
    ${HOST}
    "$_ssh_config_hosts[@]"
    "$_ssh_hosts[@]"
    "$_etc_hosts[@]"
    localhost
)
zstyle ':completion::*:*:*:hosts' hosts $hosts

# Complete manual by their section
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select

# SSH/SCP/RSYNC
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion::*:ssh:*:*' tag-order "hosts"
zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE}/zcompcache"

fpath+="${0:h}/../zsh-completions/src"
fpath+="${0:h}/../custom-completions"

compinit -d "${ZSH_CACHE}/zcompdump"

# Complete them as ssh
compdef _ssh wireshark-remote=ssh

# Complete them as ssh
compdef _ssh sshc=ssh

# Complete them as scp
compdef _scp scpc=scp

# Complete them as git
compdef _git rgit=git

# Compile the completion dump, to increase startup speed.
if [[ "${ZSH_CACHE}/zcompdump" -nt "${ZSH_CACHE}/zcompdump.zwc" || ! -f "${ZSH_CACHE}/zcompdump.zwc" ]]
then
    zcompile "${ZSH_CACHE}/zcompdump"
fi
