autoload add-zsh-hook

export ZSH_THEME_GIT_PROMPT_CACHE

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
    RPROMPT='$(git_super_status)'
}

add-zsh-hook precmd promptSetup
