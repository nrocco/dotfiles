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
	@echo "Usage: make {all|zsh|vim|git|tmux|ctags}"

all: zsh vim git tmux ctags

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

update:
	git fetch --all
	git submodule update

remove:
	@$(call __remove,$(dest)/.vim)
	@$(call __remove,$(dest)/.vimrc)
	@$(call __remove,$(dest)/.gitignore)
	@$(call __remove,$(dest)/.gitconfig)
	@$(call __remove,$(dest)/.tmux.conf)
	@$(call __remove,$(dest)/.ctags)

.PHONY: zsh vim git tmux ctags update remove help
