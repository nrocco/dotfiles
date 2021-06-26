# Remove any right prompt from display when accepting a command line. This may
# be useful with terminals with other cut/paste methods.
setopt TRANSIENT_RPROMPT

# Allow completion from within a word/phrase.
setopt COMPLETE_IN_WORD

# Automatically list choices on an ambiguous completion.
setopt AUTO_LIST

# If there is an  unambiguous  prefix  to insert on the command line, that is
# done without a completion list being displayed.
setopt LIST_AMBIGUOUS

# Automatically use menu completion after the second consecutive request for
# completion.
setopt AUTO_MENU

# When completing from the middle of a word, move the cursor to the end of the
# word.
setopt ALWAYS_TO_END

# Disable completion correction : 'sl' instead of 'ls'.
setopt NO_CORRECT

# If you type foo, and it isn't a command, and it is a directory in your
# cdpath, do not magically go there.
setopt NO_AUTO_CD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# Allow comments even in interactive shells.
setopt INTERACTIVE_COMMENTS

# Report the status of background jobs immediately, rather than waiting until
# just before printing a prompt.
setopt NOTIFY

# Do not beep on an ambiguous completion.
setopt NO_LIST_BEEP

# Print job notifications in the long format by default.
setopt LONG_LIST_JOBS

# Send the HUP signal to running jobs when the shell exits.
setopt HUP

# Allow functions to have local options.
setopt LOCAL_OPTIONS

# Allow functions to have local traps.
setopt LOCAL_TRAPS

# Allow ‘>’ redirection to truncate existing files, and ‘>>’ to create files.
setopt CLOBBER

# Treat  the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename
# generation, etc.  (An initial unquoted ‘~’ always produces named directory
# expansion.).
setopt EXTENDED_GLOB

# Do not require a leading `.' in a filename to be matched explicitly.
setopt GLOB_DOTS

# If a pattern for filename generation has no matches, print an error, instead
# of leaving it unchanged in the argument  list. This also applies to file
# expansion of an initial ‘~’ or ‘=’.
setopt NOMATCH

# History
HISTFILE="${ZSH_CACHE}/history"
SAVEHIST=100000
HISTSIZE=120000

# Share history between multiple terminal sessions
setopt SHARE_HISTORY

# Append history, instead of replace, when a terminal session exits
setopt APPEND_HISTORY

# Add commands as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY

# Ignore commands with a space before
setopt HIST_IGNORE_SPACE

# Remove the old entry and append the new one
setopt HIST_IGNORE_ALL_DUPS

# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# Whenever  the  user  enters  a  line  with  history  expansion,
# don't execute the line directly; instead, perform history
# expansion and reload  the  line  into  the  editing buffer.
setopt HIST_VERIFY

# Remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# Save  each command's beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file.
setopt EXTENDED_HISTORY
