if [[ $(uname -s) != "Darwin" ]]; then
    return
fi

if which brew > /dev/null
then
    BREW_PREFIX=$(brew --prefix)

    if [ -d "${BREW_PREFIX}/sbin" ]
    then
        path=("${BREW_PREFIX}/sbin" $path)
    fi

    if [ ! -f "${ZSH_CACHE}/coreutils_path" ]
    then
        brew --prefix coreutils > "${ZSH_CACHE}/coreutils_path"
    fi

    BREW_COREUTILS=$(cat "${ZSH_CACHE}/coreutils_path")

    if [ -d "${BREW_COREUTILS}" ]
    then
        # let GNU coreutils installed by brew take preecedence on Mac systems
        path=("${BREW_COREUTILS}/libexec/gnubin" $path)
        manpath=("${BREW_COREUTILS}/libexec/gnuman" $manpath)
    else
        # the OSX way for ls colors.
        export CLICOLOR=1
    fi
fi

unset BREW_PREFIX BREW_COREUTILS
