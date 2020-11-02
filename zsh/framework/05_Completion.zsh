autoload -Uz compinit

# General completion technique
# complete as much u can ..
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions on
zstyle ':completion:*' glob on

# Auto rehash commands
# http://www.zsh.org/mla/users/2011/msg00531.html
zstyle ':completion:*' rehash true

# # Activate color-completion(!)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# If there are more than 5 options allow selecting from a menu
zstyle ':completion:*' menu select=5
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options' auto-description '%d'

# Format on completion
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

# Set format for warnings
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'

# Start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*' insert-unambiguous true

# Format on correction
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*' original true

# Correction prompt
zstyle ':completion:correct:' prompt 'correct to: %e'

# Highlight parameters with uncommon names
zstyle ':completion:*:parameters' list-colors "=[^a-zA-Z]*=$color[red]"

# Highlight aliases
zstyle ':completion:*:aliases' list-colors "=*=$color[green]"

# Highlight the original input.
zstyle ':completion:*:original' list-colors "=*=$color[red];$color[bold]"

# Highlight words like 'esac' or 'end'
zstyle ':completion:*:reserved-words' list-colors "=*=$color[red]"

# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''

# Describe options in full
zstyle ':completion:*:options' description 'yes'

# For all completions: show comments when present
zstyle ':completion:*' verbose yes

# Completion of .. directories
zstyle ':completion:*' special-dirs true

# Fault tolerance (1 error on 3 characters)
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# Case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'

# Attempt to complete many parts at once
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' keep-prefix true tag-order all-expansions


# ~dirs: reorder output sorting: named dirs over userdirs
zstyle ':completion::*:-tilde-:*:*' group-order named-directories users

# ssh: reorder output sorting: user over hosts
zstyle ':completion::*:ssh:*:*' tag-order "users hosts"

# kill: advanced kill completion
zstyle ':completion::*:kill:*:*' command 'ps xf -U $USER -o pid,%cpu,cmd'
zstyle ':completion::*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'

# rm: advanced completion (e.g. bak files first)
zstyle ':completion::*:rm:*:*' file-patterns '*.o:object-files:object\ file *(~|.(old|bak|BAK)):backup-files:backup\ files *~*(~|.(o|old|bak|BAK)):all-files:all\ files'

# vim: advanced completion (e.g. tex and rc files first)
zstyle ':completion::*:vim:*:*' file-patterns '*Makefile|*(rc|log)|*.(php|tex|bib|sql|zsh|ini|sh|vim|rb|sh|js|tpl|csv|rdf|txt|phtml|tex|py|n3):vi-files:vim\ likes\ these\ files *~(Makefile|*(rc|log)|*.(log|rc|php|tex|bib|sql|zsh|ini|sh|vim|rb|sh|js|tpl|csv|rdf|txt|phtml|tex|py|n3)):all-files:other\ files'

# cd: complete 'cd -<tab>' with menu
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select


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

# Dont complete CVS dirs and lost+found
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/).svn'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#.svn'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found'

# Complete manual by their section
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select

# SSH/SCP/RSYNC
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
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

alias dc='docker-compose'
compdef dc=docker-compose

# Compile the completion dump, to increase startup speed.
if [[ "${ZSH_CACHE}/zcompdump" -nt "${ZSH_CACHE}/zcompdump.zwc" || ! -f "${ZSH_CACHE}/zcompdump.zwc" ]]
then
    zcompile "${ZSH_CACHE}/zcompdump"
fi
