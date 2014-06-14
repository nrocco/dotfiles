# Set the note directory.
[ -z $NOTEDIR ] && NOTEDIR=~/.notes

# Take a text file and build it with an extension, if needed.
# Prefer gpg extension over txt.
buildfile() {
    # If an extension was given, use it.
    if [[ "$1" == *.* ]]; then
        echo "$1"

    # If no extension was given...
    else
        # ... try the file without any extension.
        if [ -e "$1" ]; then
            echo "$1"
        # ... try the file with a gpg extension.
        elif [ -e "$1".gpg ]; then
            echo "$1".gpg
        # ... use a txt extension.
        else
            echo "$1".txt
        fi
    fi
}

# Create or edit notes.
n() {
    # If no note was given, list the notes.
    if [ -z "$1" ]; then
        lt "$NOTEDIR"
    # If a note was given, open it.
    else
        $EDITOR $(buildfile "$NOTEDIR"/"$1")
    fi
}


# Find a note by title.
nf() {
    if [ -z "$1" ]; then
        lt "$NOTEDIR"
    else
        lt "$NOTEDIR" | grep -i $1
    fi
}


# Search within notes.
ns() { cd $NOTEDIR; grep -rin $1; cd "$OLDPWD"; }


# Set autocompletion for notes.
compctl -W $NOTEDIR -f n
