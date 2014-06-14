dest = ~
comp_dir = /etc/bash_completion.d
bashd_dir = $(dest)/.bash.d

BASHD_STRING = if [ -d $(bashd_dir) ]; then for f in $(bashd_dir)/*; do . \$$f; done; fi \#dotfiles-autogen

__link_if_not_exist = if [ ! -e $(1) ]; then /bin/ln -s $(2) $(1); fi
__remove_if_exists = if [ -L $(1) ]; then $(RM) $(1); fi

help:
	@echo "Usage: make {instal|remove}"
	@echo 'dest              $(dest)'
	@echo 'bashd_dir         $(bashd_dir)'
	@echo "comp_dir          $(comp_dir)"

__make_dest:
	[ -d $(dest) ] || mkdir -p $(dest)

__make_dest_bashd_dir:
	[ -d $(bashd_dir) ] || mkdir -p $(bashd_dir)

__source_dest_bashd_files:
	grep dotfiles-autogen $(dest)/.bashrc > /dev/null 2>&1 || echo "$(BASHD_STRING)" >> $(dest)/.bashrc

__remove_source_dest_bashd_files:
	if [ -f $(dest)/.bashrc ]; then sed -i '/dotfiles-autogen/d' $(dest)/.bashrc; fi
	[ -s $(dest)/.bashrc ] || $(RM) $(dest)/.bashrc


install: __make_dest install_bash install_vim install_git install_tmux install_ctags install_nano install_pythonrc
remove: remove_bash remove_pythonrc remove_nano remove_ctags remove_tmux remove_git remove_vim


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

install_bash: __make_dest_bashd_dir __source_dest_bashd_files
	$(call __link_if_not_exist,$(dest)/.inputrc,$$(pwd)/readline/inputrc)
	$(call __link_if_not_exist,$(bashd_dir)/10-aliases,$$(pwd)/bash/aliases)
	$(call __link_if_not_exist,$(bashd_dir)/20-ps1,$$(pwd)/bash/ps1)
	$(call __link_if_not_exist,$(bashd_dir)/60-venv,$$(pwd)/bash/venv)
	$(call __link_if_not_exist,$(bashd_dir)/90-tmux-start-session,$$(pwd)/tmux/start-session)


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

remove_bash: __remove_source_dest_bashd_files
	$(call __remove_if_exists,$(dest)/.inputrc)
	$(call __remove_if_exists,$(bashd_dir)/10-aliases)
	$(call __remove_if_exists,$(bashd_dir)/20-ps1)
	$(call __remove_if_exists,$(bashd_dir)/60-venv)
	$(call __remove_if_exists,$(bashd_dir)/90-tmux-start-session)
	[ "$(shell ls -A $(bashd_dir))" ] || $(RM) -r $(bashd_dir)
