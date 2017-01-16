dest := ~
host := $(shell hostname -s | tr '[A-Z]' '[a-z]')


update:
	git fetch --all --prune
	git pull origin master
	git submodule init
	git submodule sync
	git submodule update
	git submodule foreach git checkout master
	git submodule foreach git pull origin master
	git gc
	git status


ifeq ($(wildcard hosts/$(host)/curl/curlrc),)
$(dest)/.curlrc: curl/curlrc
else
$(dest)/.curlrc: hosts/$(host)/curl/curlrc
endif
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/zsh/zshrc),)
$(dest)/.zshrc: zsh/zshrc
else
$(dest)/.zshrc: hosts/$(host)/zsh/zshrc
endif
	ln -sf "$(PWD)/$<" "$@"


$(dest)/.zsh: zsh/
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/zsh/general.zsh),)
$(dest)/.zsh/95_General.zsh: general.zsh
else
$(dest)/.zsh/95_General.zsh: hosts/$(host)/zsh/general.zsh
endif
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/local.zsh),)
$(dest)/.zsh/98_Local.zsh:
else
$(dest)/.zsh/98_Local.zsh: hosts/$(host)/local.zsh
	ln -sf "$(PWD)/$<" "$@"
endif


ifeq ($(wildcard hosts/$(host)/vim/vimrc),)
$(dest)/.vimrc: vim/vimrc
else
$(dest)/.vimrc: hosts/$(host)/vim/vimrc
endif
	ln -sf "$(PWD)/$<" "$@"


$(dest)/.vim: vim/
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/gpg/gpg.conf),)
$(dest)/.gnupg/gpg.conf: gpg/gpg.conf
else
$(dest)/.gnupg/gpg.conf: hosts/$(host)/gpg/gpg.conf
endif
	mkdir -p "$(dest)/.gnupg"
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/gpg/gpg-agent.conf),)
$(dest)/.gnupg/gpg-agent.conf: gpg/gpg-agent.conf
else
$(dest)/.gnupg/gpg-agent.conf: hosts/$(host)/gpg/gpg-agent.conf
endif
	mkdir -p "$(dest)/.gnupg"
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/git/gitignore),)
$(dest)/.gitignore: git/gitignore
else
$(dest)/.gitignore: hosts/$(host)/git/gitignore
endif
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/git/gitconfig),)
$(dest)/.gitconfig: git/gitconfig
else
$(dest)/.gitconfig: hosts/$(host)/git/gitconfig
endif
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/tmux/tmux.conf),)
$(dest)/.tmux.conf: tmux/tmux.conf
else
$(dest)/.tmux.conf: hosts/$(host)/tmux/tmux.conf
endif
	ln -sf "$(PWD)/$<" "$@"


ifeq ($(wildcard hosts/$(host)/ctags/ctags),)
$(dest)/.ctags: ctags/ctags
else
$(dest)/.ctags: hosts/$(host)/ctags/ctags
endif
	ln -sf "$(PWD)/$<" "$@"


remove:
	@$(call __remove,$(dest)/.ctags)
	@$(call __remove,$(dest)/.curlrc)
	@$(call __remove,$(dest)/.gitconfig)
	@$(call __remove,$(dest)/.gitignore)
	@$(call __remove,$(dest)/.tmux.conf)
	@$(call __remove,$(dest)/.vim)
	@$(call __remove,$(dest)/.vimrc)


ctags: $(dest)/.ctags
curl: $(dest)/.curlrc
git: $(dest)/.gitignore $(dest)/.gitconfig
gpg: $(dest)/.gnupg/gpg.conf $(dest)/.gnupg/gpg-agent.conf
tmux: $(dest)/.tmux.conf
vim: $(dest)/.vimrc $(dest)/.vim
zsh: $(dest)/.zshrc $(dest)/.zsh $(dest)/.zsh/95_General.zsh $(dest)/.zsh/98_Local.zsh

all: zsh ctags curl git vim
