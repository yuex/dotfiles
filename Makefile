DST_DIR=~
MODULE_INSTALL=bashrc nethackrc tmux.conf zshrc vim vimrc dircolors-solarized oh-my-zsh 
#DST_DIR=test
#MODULE_INSTALL=zshrc oh-my-zsh

#------------------------------------------------------------
SRC_DIR=~

BAK_DIR=backup
BAK_LOCK=${BAK_DIR}/lock

VIM_VUNDLE=${DST_DIR}/.vim/bundle/Vundle.vim
OH_MY_ZSH=${DST_DIR}/.oh-my-zsh

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

#vimrc: ${VIM_VUNDLE}
vimrc: backup vim
	ln -frs $@ ${DST_DIR}/.$@
	#vim -c 'PluginInstall' -c 'qa'

#${VIM_VUNDLE}:
vim: backup
	if [ ! -e ${DST_DIR}/.$@ ]; then \
		mkdir -p ${DST_DIR}/.$@/bundle; \
		git clone https://github.com/gmarik/Vundle.vim.git ${DST_DIR}/.$@/bundle/Vundle.vim; \
		mv -b ${DST_DIR}/.$@ $@; \
		ln -frs $@ ${DST_DIR}/.$@; \
	fi

#zshrc: ${OH_MY_ZSH}
zshrc: backup dircolors-solarized oh-my-zsh 
	ln -frs $@ ${DST_DIR}/.$@

#${OH_MY_ZSH}:
oh-my-zsh: backup
	if [ ! -e ${DST_DIR}/.$@ ]; then \
		echo $$SHELL > old_shell; \
		sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; \
		mv -b ${DST_DIR}/.$@ $@; \
		ln -frs $@ ${DST_DIR}/.$@; \
	fi
	#[ ! -e $@ ] && mkdir $@

dircolors-solarized: backup
	if [ ! -e ${DST_DIR}/.$@ ]; then \
		git clone https://github.com/seebi/dircolors-solarized.git ${DST_DIR}/.$@; \
		mv -b ${DST_DIR}/.$@ $@; \
		ln -frs $@ ${DST_DIR}/.$@; \
	fi

install: backup ${MODULE_INSTALL}

backup:
	if [ ! -e ${BAK_LOCK} ]; then \
		[ ! -e ${BAK_DIR} ] && mkdir ${BAK_DIR}; \
		if [ -e ${DST_DIR} ]; then \
			for f in ${MODULE_INSTALL}; do \
				file=${DST_DIR}/.$$f; \
				if [ -e $$file ]; then \
					mv -b $$file ${BAK_DIR}; \
				fi; \
			done && touch ${BAK_LOCK} || rm -rf ${BAK_DIR}; \
		fi; \
	fi

restore: delete
	if [ -e ${BAK_LOCK} ]; then \
		if [ -e ${BAK_DIR} -a -e ${DST_DIR} ]; then \
			for f in ${MODULE_INSTALL}; do \
				file=${BAK_DIR}/.$$f; \
				if [ -e $$file ]; then \
					cp -rf $$file ${DST_DIR}; \
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
