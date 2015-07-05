dest := ~
host := $(shell hostname)
curr := $(shell pwd)

__link_if_not_exist = \
					  if [ ! -e $(1) ]; \
	                  then \
	                      if [ -e $(curr)/hosts/$(host)/$(2) ]; \
	                      then \
	                  	      ln -s $(curr)/hosts/$(host)/$(2) $(1); \
	                      else \
	                  	      ln -s $(2) $(1); \
	                      fi \
	                  fi

__remove_if_exists  = \
					  if [ -L $(1) ]; \
					  then \
					      rm $(1); \
					  fi

help:
	@echo "Usage: make {instal|remove}"

install_zsh:
	$(call __link_if_not_exist,$(dest)/.zshrc,zsh/zshrc)
	$(call __link_if_not_exist,$(dest)/.zsh,zsh)
	$(call __link_if_not_exist,$(dest)/.zsh/95_General.zsh,general.zsh)
	$(call __link_if_not_exist,$(dest)/.zsh/98_Local.zsh,local.zsh)

install_vim:
	$(call __link_if_not_exist,$(dest)/.vimrc,vim/vimrc)
	$(call __link_if_not_exist,$(dest)/.vim,vim)

install_git:
	$(call __link_if_not_exist,$(dest)/.gitignore,git/gitignore)
	$(call __link_if_not_exist,$(dest)/.gitconfig,git/gitconfig)

install_tmux:
	$(call __link_if_not_exist,$(dest)/.tmux.conf,tmux/tmux.conf)

install_ctags:
	$(call __link_if_not_exist,$(dest)/.ctags,ctags/ctags)

install_nano:
	$(call __link_if_not_exist,$(dest)/.nanorc,nano/nanorc)

install_pythonrc:
	$(call __link_if_not_exist,$(dest)/.pythonrc.py,python/pythonrc.py)

install_xorg:
	$(call __link_if_not_exist,$(dest)/.xserverrc,x11/xserverrc)
	$(call __link_if_not_exist,$(dest)/.Xresources,x11/Xresources)
	$(call __link_if_not_exist,$(dest)/.xinitrc,x11/xinitrc)
	$(call __link_if_not_exist,$(dest)/.xmodmap,x11/xmodmap)
	$(call __link_if_not_exist,$(dest)/.i3,i3)

update:
	git fetch --all
	git submodule update

remove:
	$(call __remove_if_exists,$(dest)/.vim)
	$(call __remove_if_exists,$(dest)/.vimrc)
	$(call __remove_if_exists,$(dest)/.gitignore)
	$(call __remove_if_exists,$(dest)/.gitconfig)
	$(call __remove_if_exists,$(dest)/.tmux.conf)
	$(call __remove_if_exists,$(dest)/.ctags)
	$(call __remove_if_exists,$(dest)/.nanorc)
	$(call __remove_if_exists,$(dest)/.pythonrc.py)
