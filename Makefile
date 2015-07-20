DST_DIR=test
MODULE_INSTALL=bashrc
#MODULE_INSTALL=bashrc nethackrc tmux.conf zshrc vimrc


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

bashrc nethackrc tmux.conf:
	ln -rs $@ ${DST_DIR}/.$@

vimrc: ${VIM_VUNDLE}
	ln -rs $@ ${DST_DIR}/.$@
	vim -c 'PluginInstall | q!'

${VIM_VUNDLE}:
	git clone https://github.com/gmarik/Vundle.vim.git $@

zshrc: ${OH_MY_ZSH}
	ln -rs $@ ${DST_DIR}/.$@

${OH_MY_ZSH}:
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

install: backup ${MODULE_INSTALL}

backup:
	[ ! -e ${BAK_DIR} ] && mkdir ${BAK_DIR} && [ -e ${DST_DIR} ] && \
	for f in ${MODULE_INSTALL}; do \
		file=${DST_DIR}/.$$f; \
		[ -e $$file ] && cp $$file ${BAK_DIR}; \
	done && touch ${BAK_LOCK}

restore:
	[ -e ${BAK_DIR} ] && [ -e ${BAK_LOCK} && [ -e ${DST_DIR} ] && \
	for f in ${MODULE_INSTALL}; do \
		file=${BAK_DIR}/.$$f; \
		[ -e $$file ] && cp $$file ${DST_DIR}; \
	done

delete:
	for f in ${MODULE_INSTALL}; do \
		file=${DST_DIR}/.$$f; \
		[ -e $$file ] && rm $$file; \
	done; \
	:


.PHONY: compile remove ${MODULE_SRC} install backup clean restore delete
