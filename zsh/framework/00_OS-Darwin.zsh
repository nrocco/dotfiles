if [[ $(uname -s) != "Darwin" ]]; then
    return
fi

if which brew > /dev/null
then
    export PATH="/usr/local/sbin:${PATH}"
    if [ ! -f "${ZSH_CACHE}/coreutils_path" ]
    then
        brew --prefix coreutils > "${ZSH_CACHE}/coreutils_path"
    fi
    BREW_COREUTILS=$(cat "${ZSH_CACHE}/coreutils_path")
fi

if [ -d "${BREW_COREUTILS}" ]; then
    # let GNU coreutils installed by brew take preecedence on Mac systems
    export PATH="${BREW_COREUTILS}/libexec/gnubin:${PATH}"
    export MANPATH="${BREW_COREUTILS}/libexec/gnuman:${MANPATH}"
else
    # the OSX way for ls colors.
    export CLICOLOR=1
fi

unset BREW_COREUTILS
