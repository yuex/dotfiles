DST_DIR=~
MODULE_INSTALL=bashrc nethackrc tmux.conf zshrc vim vimrc dircolors-solarized oh-my-zsh 
#DST_DIR=test
#MODULE_INSTALL=zshrc oh-my-zsh

#------------------------------------------------------------
SRC_DIR=~

BAK_DIR=backup
BAK_LOCK=${BAK_DIR}/lock

MODULE_SRC=bashrc nethackrc tmux.conf zshrc vimrc

compile: remove
	for f in ${MODULE_SRC}; do\
		cp ${SRC_DIR}/.$$f $$f; \
	done

# use $$ prefix to pass parameter to bash to interpret
# bash script must be written within one line, forget this never
remove:
	for f in ${MODULE_SRC}; do \
		[ -e $$f ] && rm $$f; \
	done; \
	:

bashrc nethackrc tmux.conf: backup
	ln -frs $@ ${DST_DIR}/.$@

vimrc: backup vim
	ln -frs $@ ${DST_DIR}/.$@

vim: backup
	if [ -e $@ ]; then \
		rm -rf $@; \
	fi
	mkdir -p $@/bundle
	git clone https://github.com/gmarik/Vundle.vim.git $@/bundle/Vundle.vim
	ln -frs $@ ${DST_DIR}/.$@
	vim -c 'PluginInstall' -c 'qa'
	#$@/bundle/YouCompleteMe/install.sh

zshrc: backup dircolors-solarized oh-my-zsh 
	ln -frs $@ ${DST_DIR}/.$@

oh-my-zsh: backup
	if [ -e $@ ]; then \
		rm -rf $@; \
	fi
	mkdir $@
	git clone https://github.com/robbyrussell/oh-my-zsh.git $@
	ln -frs $@ ${DST_DIR}/.$@

dircolors-solarized: backup
	if [ -e $@ ]; then \
		rm -rf $@; \
	fi
	mkdir $@
	git clone https://github.com/seebi/dircolors-solarized.git $@
	ln -frs $@ ${DST_DIR}/.$@

install: backup ${MODULE_INSTALL}

backup:
	if [ ! -e ${BAK_LOCK} ]; then \
		if [ ! -e ${BAK_DIR} ]; then \
			mkdir ${BAK_DIR}; \
		fi; \
		if [ -e ${DST_DIR} ]; then \
			for f in ${MODULE_INSTALL}; do \
				src_file=${DST_DIR}/.$$f; \
				dst_file=${BAK_DIR}/.$$f; \
				if [ -e $$src_file ]; then \
					cp -a $$src_file $$dst_file; \
				else \
					> $$dst_file; \
				fi; \
			done && touch ${BAK_LOCK}; \
		fi; \
	fi

restore:
	if [ -e ${BAK_LOCK} ]; then \
		if [ -e ${BAK_DIR} -a -e ${DST_DIR} ]; then \
			for f in ${MODULE_INSTALL}; do \
				src_file=${BAK_DIR}/.$$f; \
				dst_file=${DST_DIR}/.$$f; \
				if [ -e $$src_file ]; then \
					if [ -e $$dst_file ]; then \
						rm -rf $$dst_file; \
					fi; \
					if [ -s $$src_file ]; then \
						cp -a $$src_file $$dst_file; \
					fi; \
				fi; \
			done; \
		fi; \
	fi

delete:
	for f in ${MODULE_INSTALL}; do \
		file=${DST_DIR}/.$$f; \
		if [ -L $$file -o -e $$file ]; then \
			rm -rf $$file; \
		fi; \
	done
	if [ -e old_shell -a "$$SHELL" != "$$(<old_shell)" ]; then \
		chsh -s "$$(<old_shell)"; \
	fi

.PHONY: compile remove ${MODULE_SRC} install backup clean restore delete
