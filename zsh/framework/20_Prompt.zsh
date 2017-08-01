# Enable hook method
autoload add-zsh-hook

# Enable and configure vcs_info
autoload -Uz vcs_info
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable hg git cvs svn
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*' stagedstr ':+'
zstyle ':vcs_info:*' unstagedstr ':*'

zstyle ':vcs_info:(hg|git):*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}%c%u%m|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:(hg|git):*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}%c%u%m]%f '

zstyle ':vcs_info:git*+set-message:*' hooks git-aheadbehind git-stash

# https://github.com/blaenk/dots/blob/master/zsh/zsh/vcsinfo.zsh
function +vi-git-aheadbehind() {
    local ahead behind
    local -a gitstatus

    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | tr -d ' ')
    (( $behind )) && gitstatus+=( "-${behind}" )

    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
    (( $ahead )) && gitstatus+=( "+${ahead}" )

    [ 0 -eq ${#gitstatus[@]} ] || hook_com[misc]+=":${(j::)gitstatus}"
}

function +vi-git-stash() {
    if [[ -s ${hook_com[base]}/.git/refs/stash ]]
    then
        hook_com[misc]+=':$'
    fi
}

# Prompt theme
function promptSetup () {
    setopt prompt_subst

    # color support for root
    if [ "$USER" = 'root' ]; then
        base_prompt="%B%F{red}%m%k "
    else
        base_prompt="%B%F{green}%n@%m%k "
    fi

    # prefixes
    post_prompt="%b%f%k"
    jobs_prompt="%(?..%B%F{yellow}<%?>)%(1j.%B%F{cyan}{%j}.)"
    path_prompt="%B%F{yellow}%1~"

    # left prompts
    PS1="$jobs_prompt$base_prompt$path_prompt %# $post_prompt"
    PS2="$jobs_prompt$base_prompt$path_prompt %_> $post_prompt"
    PS3="$jobs_prompt$base_prompt$path_prompt ?# $post_prompt"
    PS4="+%B%* %F{cyan}%N%f:%F{yellow}%i%f>%b "

    # right prompt
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd promptSetup
