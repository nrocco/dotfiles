autoload -Uz compinit

# # Complete as much u can: https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Control-Functions
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _prefix

# Activate color-completion(!)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# If there are more than 5 options allow selecting from a menu
zstyle ':completion:*' menu select=1

# Usually, on Unix systems, // is expanded to /. Prefer this behavior
zstyle ':completion:*' squeeze-slashes true

# Start menu completion only if it could find no unambiguous initial string at least as long as the original string typed by the user.
zstyle ':completion:*:match:*' insert-unambiguous true

# Fuzzy match mistyped completions
zstyle ':completion:*:match:*' original only

# # Attempt to complete many parts at once
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE}/zcompcache"

fpath+="${0:h}/../zsh-completions/src"
fpath+="${0:h}/../custom-completions"

compinit -d "${ZSH_CACHE}/zcompdump"

# Complete programs as other programs
compdef _ssh wireshark-remote=ssh
compdef _ssh sshc=ssh
compdef _scp scpc=scp
compdef _git rgit=git

# Compile the completion dump, to increase startup speed.
if [[ "${ZSH_CACHE}/zcompdump" -nt "${ZSH_CACHE}/zcompdump.zwc" || ! -f "${ZSH_CACHE}/zcompdump.zwc" ]]
then
    zcompile "${ZSH_CACHE}/zcompdump"
fi
