if [[ "$(uname -s)" != "Darwin" ]]; then
    return
fi

if [ -d "/usr/local/sbin" ]
then
    path=("/usr/local/sbin/sbin" $path)
fi

if [ -d "/usr/local/opt/coreutils" ]
then
    path=("/usr/local/opt/coreutils/libexec/gnubin" $path)
    manpath=("/usr/local/opt/coreutils/libexec/gnuman" $manpath)
fi
