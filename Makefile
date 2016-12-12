dest := ~
host := $(shell hostname -s)
curr := $(shell pwd)

__install = if [ ! -e $(1) ]; then \
                if [ -e $(curr)/hosts/$(host)/$(2) ]; then \
                    ln -s $(curr)/hosts/$(host)/$(2) $(1); \
					ls -gG $(1); \
                elif [ -e $(curr)/$(2) ]; then \
                    ln -s $(curr)/$(2) $(1); \
					ls -gG $(1); \
                fi; \
            else \
                ls -gG $(1); \
            fi

__remove  = if [ -L $(1) ]; \
            then \
                rm $(1); \
            fi

help:
	@echo "Usage: make {all|zsh|vim|git|gpg|tmux|ctags}"

all: zsh vim git tmux ctags gpg

zsh:
	@$(call __install,$(dest)/.zshrc,zsh/zshrc)
	@$(call __install,$(dest)/.zsh,zsh)
	@$(call __install,$(dest)/.zsh/95_General.zsh,general.zsh)
	@$(call __install,$(dest)/.zsh/98_Local.zsh,local.zsh)

vim:
	@$(call __install,$(dest)/.vimrc,vim/vimrc)
	@$(call __install,$(dest)/.vim,vim)

git:
	@$(call __install,$(dest)/.gitignore,git/gitignore)
	@$(call __install,$(dest)/.gitconfig,git/gitconfig)

tmux:
	@$(call __install,$(dest)/.tmux.conf,tmux/tmux.conf)

ctags:
	@$(call __install,$(dest)/.ctags,ctags/ctags)

gpg:
	@$(call __install,$(dest)/.gnupg/gpg.conf,gpg/gpg.conf)
	@$(call __install,$(dest)/.gnupg/gpg-agent.conf,gpg/gpg-agent.conf)

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

remove:
	@$(call __remove,$(dest)/.vim)
	@$(call __remove,$(dest)/.vimrc)
	@$(call __remove,$(dest)/.gitignore)
	@$(call __remove,$(dest)/.gitconfig)
	@$(call __remove,$(dest)/.tmux.conf)
	@$(call __remove,$(dest)/.ctags)

.PHONY: zsh vim git tmux ctags update remove help gpg
