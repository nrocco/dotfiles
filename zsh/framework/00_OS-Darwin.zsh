if [[ $(uname -s) != "Darwin" ]]; then
    return
fi

if which brew > /dev/null
then
    local prefix=$(brew --prefix)

    if [ -d "${prefix}/sbin" ]
    then
        path=("${prefix}/sbin" $path)
    fi

    if [ ! -f "${ZSH_CACHE}/coreutils_path" ]
    then
        brew --prefix coreutils > "${ZSH_CACHE}/coreutils_path"
    fi

    local coreutils=$(cat "${ZSH_CACHE}/coreutils_path")

    if [ -d "${coreutils}" ]
    then
        path=("${coreutils}/libexec/gnubin" $path)
        manpath=("${coreutils}/libexec/gnuman" $manpath)
    fi
fi
