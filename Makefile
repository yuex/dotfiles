DST_DIR=test
MODULE_INSTALL=zshrc oh-my-zsh
#MODULE_INSTALL=bashrc nethackrc tmux.conf oh-my-zsh zshrc vim vimrc

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
	#vim -c 'PluginInstall | q!'

#${VIM_VUNDLE}:
vim: backup
	if [ ! -e $@ ]; then \
		mkdir $@; \
	fi
	#[ ! -e $@ ] && mkdir $@
	ln -frs $@ ${DST_DIR}/.$@
	git clone https://github.com/gmarik/Vundle.vim.git ${VIM_VUNDLE}

#zshrc: ${OH_MY_ZSH}
zshrc: backup oh-my-zsh
	ln -frs $@ ${DST_DIR}/.$@

#${OH_MY_ZSH}:
oh-my-zsh: backup
	if [ ! -e $@ ]; then \
		mkdir $@; \
	fi
	#[ ! -e $@ ] && mkdir $@
	ln -frs $@ ${DST_DIR}/.$@
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

install: backup ${MODULE_INSTALL}

backup:
	if [ ! -e ${BAK_LOCK} ]; then \
		[ ! -e ${BAK_DIR} ] && mkdir ${BAK_DIR}; \
		if [ -e ${DST_DIR} ]; then \
			for f in ${MODULE_INSTALL}; do \
				file=${DST_DIR}/.$$f; \
				[ -e $$file ] && mv -b $$file ${BAK_DIR}; \
			done && touch ${BAK_LOCK} || rm -rf ${BAK_DIR}; \
		fi; \
	fi

restore: delete
	if [ -e ${BAK_LOCK} ]; then \
		if [ -e ${BAK_DIR} -a -e ${DST_DIR} ]; then \
			for f in ${MODULE_INSTALL}; do \
				file=${BAK_DIR}/.$$f; \
				[ -e $$file ] && cp -rf $$file ${DST_DIR}; \
			done; \
		fi; \
	fi

delete:
	for f in ${MODULE_INSTALL}; do \
		file=${DST_DIR}/.$$f; \
		[ -e $$file ] && rm $$file; \
	done || :

.PHONY: compile remove ${MODULE_SRC} install backup clean restore delete
