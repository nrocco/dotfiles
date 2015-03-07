dest = ~

__link_if_not_exist = if [ ! -e $(1) ]; then /bin/ln -s $(2) $(1); fi
__remove_if_exists = if [ -L $(1) ]; then $(RM) $(1); fi

help:
	@echo "Usage: make {instal|remove}"
	@echo 'dest              $(dest)'

__make_dest:
	[ -d $(dest) ] || mkdir -p $(dest)

install: __make_dest install_vim install_git install_tmux install_ctags install_nano install_pythonrc
remove: remove_pythonrc remove_nano remove_ctags remove_tmux remove_git remove_vim

install_vim:
	$(call __link_if_not_exist,$(dest)/.vimrc,$$(pwd)/vim/vimrc)
	$(call __link_if_not_exist,$(dest)/.vim,$$(pwd)/vim)

install_git:
	$(call __link_if_not_exist,$(dest)/.gitignore,$$(pwd)/git/gitignore)
	$(call __link_if_not_exist,$(dest)/.gitconfig,$$(pwd)/git/gitconfig)

install_tmux:
	$(call __link_if_not_exist,$(dest)/.tmux.conf,$$(pwd)/tmux/tmux.conf)

install_ctags:
	$(call __link_if_not_exist,$(dest)/.ctags,$$(pwd)/ctags/ctags)

install_nano:
	$(call __link_if_not_exist,$(dest)/.nanorc,$$(pwd)/nano/nanorc)

install_pythonrc:
	$(call __link_if_not_exist,$(dest)/.pythonrc.py,$$(pwd)/python/pythonrc.py)

remove_vim:
	$(call __remove_if_exists,$(dest)/.vim)
	$(call __remove_if_exists,$(dest)/.vimrc)

remove_git:
	$(call __remove_if_exists,$(dest)/.gitignore)
	$(call __remove_if_exists,$(dest)/.gitconfig)

remove_tmux:
	$(call __remove_if_exists,$(dest)/.tmux.conf)

remove_ctags:
	$(call __remove_if_exists,$(dest)/.ctags)

remove_nano:
	$(call __remove_if_exists,$(dest)/.nanorc)

remove_pythonrc:
	$(call __remove_if_exists,$(dest)/.pythonrc.py)
