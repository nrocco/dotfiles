dotfiles
========

my dotfiles


installation
------------

Clone this repository:

    git clone https://github.com/nrocco/dotfiles.git ~/.dotfiles


Fetch all dependencies:

    cd ~/.dotfiles
    make update


Symlink dotfiles to your `$HOME` directory:

    make ctags curl git zsh vim


If you use `tmux`:

    make tmux


And if you use `gpg`:

    make gpg


Now open a terminal window
