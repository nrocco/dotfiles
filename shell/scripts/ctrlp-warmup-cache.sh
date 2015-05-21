#!/bin/bash

IGNORE_DIRS_DEFAULTS=".git .svn"
IGNORE_DIRS=( ${IGNORE_DIRS[@]} ${IGNORE_DIRS_DEFAULTS[@]} )

CACHE_DIR="$HOME/.cache/ctrlp"

function warmup() {
    [ ! -d "$directory" ] && return 1

    local project="$(realpath $1)"
    local cache_file="${CACHE_DIR}/${project//\//%}.txt"
    local prune=

    for dir in "${IGNORE_DIRS[@]}"
    do
        prune="$prune -path $dir -prune -or"
    done

    echo "==> Storying results in $cache_file"

    # Use a subshell to avoid changing your shell's current directory
    ( cd "$project" && find * $prune \( -type f -and -print \) ) > "$cache_file"
}


for directory in "$@"
do
    warmup "$directory"
done
