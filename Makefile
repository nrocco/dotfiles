update:
	git fetch --all --prune
	git pull origin master
	git submodule init
	git submodule sync --recursive
	git submodule update
	git submodule foreach --recursive git checkout master
	git submodule foreach --recursive git pull origin master
	wget -O zsh/custom-completions/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
	wget -O zsh/custom-completions/_docker-compose https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose
	vim +PlugClean +PlugUpdate +qall
	git gc
	git add \
		zsh/LS_COLORS \
		zsh/git-prompt.zsh \
		zsh/zsh-completions \
		zsh/zsh-syntax-highlighting \
		zsh/custom-completions/_docker \
		zsh/custom-completions/_docker-compose \
		&& git commit -m 'Updated 3rd party dependencies'
	git status


~/.curlrc: curl/curlrc
	ln -sf "$(PWD)/$<" "$@"


~/.zshrc: zsh/zshrc
	ln -sf "$(PWD)/$<" "$@"


~/.config/fd/ignore: fdignore
	mkdir -p ~/.config/fd
	ln -sf "$(PWD)/$<" "$@"


~/.vimrc: vim/vimrc
	ln -sf "$(PWD)/$<" "$@"


~/.vim: vim
	ln -sf "$(PWD)/$<" "$@"


~/.gnupg/gpg.conf: gpg/gpg.conf
	mkdir -p "~/.gnupg"
	ln -sf "$(PWD)/$<" "$@"


~/.gnupg/gpg-agent.conf: gpg/gpg-agent.conf
	mkdir -p "~/.gnupg"
	ln -sf "$(PWD)/$<" "$@"


~/.gnupg/dirmngr.conf: gpg/dirmngr.conf
	mkdir -p "~/.gnupg"
	ln -sf "$(PWD)/$<" "$@"


~/.gitignore: git/gitignore
	ln -sf "$(PWD)/$<" "$@"


~/.gitconfig: git/gitconfig
	ln -sf "$(PWD)/$<" "$@"


~/.tmux.conf: tmux/tmux.conf
	ln -sf "$(PWD)/$<" "$@"


~/.ctags: ctags/ctags
	ln -sf "$(PWD)/$<" "$@"


remove:
	@$(call __remove,~/.ctags)
	@$(call __remove,~/.curlrc)
	@$(call __remove,~/.gitconfig)
	@$(call __remove,~/.gitignore)
	@$(call __remove,~/.tmux.conf)
	@$(call __remove,~/.vim)
	@$(call __remove,~/.vimrc)


ctags: ~/.ctags
curl: ~/.curlrc
fd: ~/.config/fd/ignore
git: ~/.gitignore ~/.gitconfig
gpg: ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf ~/.gnupg/dirmngr.conf
tmux: ~/.tmux.conf
vim: ~/.vimrc ~/.vim
zsh: ~/.zshrc


all: zsh ctags curl git vim
