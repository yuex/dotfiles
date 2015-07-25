DST_DIR = ~
#DST_DIR=test
# VPATH = src:../headers to search src and ../headers
# or vpath %.h ../headers:/usr/include for searching files of specific pattern
# but not suitable to this case
SRC_DIR = ~
DRC_DIR = source
LIB_DIR = lib
BAK_DIR=.backup
BAK_LOCK=${BAK_DIR}/lock


.PHONY: compile remove install backup restore \
	$(RC_MODULE) \
	$(addprefix install-,$(RC_MODULE)) \
	$(addprefix plugin-,$(RC_MODULE)) \
	dircolors-solarized \
	oh-my-zsh \
	vundle \

RC_MODULE=bash nethack tmux vim zsh
RC_INCLUDE=bashrc nethackrc tmux.conf zshrc vimrc
RC_DEPENDS=dircolors-solarized oh-my-zsh vim
MODULE_INSTALL=bashrc nethackrc tmux.conf zshrc vim vimrc dircolors-solarized oh-my-zsh

.ONESHELL:
$(DRC_DIR)/RC_MODULE_LIST:
	> $@
	echo $(RC_MODULE) |sed 's/ /\n/g' |sed 's/^/* /g' >> $@

.ONESHELL:
$(DRC_DIR)/RC_MODULE_MAKE:
	> $@
	echo $(RC_MODULE) |sed 's/ /\n/g' |sed 's/^/make /g' >> $@

compile: $(DRC_DIR)/RC_MODULE_LIST $(DRC_DIR)/RC_MODULE_MAKE
	$(MAKE) -C $(DRC_DIR) $(RC_INCLUDE)

remove:
	$(MAKE) -C $(DRC_DIR) clean

$(LIB_DIR) $(BAK_DIR) $(DST_DIR):
	mkdir $@

$(LIB_DIR)/%: |$(LIB_DIR)
	mkdir -p $@

$(RC_MODULE): %:backup install-%

define link-prereq=
	ln -fs $(abspath $<) $(DST_DIR)/.$(<F)
endef

define git-update=
	if [ ! -d $</.git ]; then
		git clone $$url $<
	else
		sh -c 'cd $< && git pull'
	fi
endef

install-nethack: install-%:$(DRC_DIR)/%rc
	$(link-prereq)

install-tmux: install-%:$(DRC_DIR)/%.conf
	$(link-prereq)

install-zsh install-bash: install-%:$(DRC_DIR)/%rc plugin-%
	$(link-prereq)

.ONESHELL:
install-vim: install-%:$(DRC_DIR)/%rc plugin-%
	$(link-prereq)
	vim -c 'PluginInstall!' -c 'qa'

plugin-vim: $(LIB_DIR)/vim vundle
	$(link-prereq)

plugin-zsh: dircolors-solarized oh-my-zsh

plugin-bash: dircolors-solarized

.ONESHELL:
dircolors-solarized: %:$(LIB_DIR)/%
	url=https://github.com/seebi/dircolors-solarized.git
	$(git-update)
	$(link-prereq)

.ONESHELL:
oh-my-zsh: %:$(LIB_DIR)/%
	url=https://github.com/robbyrussell/oh-my-zsh.git
	$(git-update)
	$(link-prereq)

.ONESHELL:
vundle: $(LIB_DIR)/vim/bundle/Vundle.vim
	url=https://github.com/gmarik/Vundle.vim.git
	$(git-update)

install: backup $(RC_MODULE)

.ONESHELL:
backup: |$(BAK_DIR) $(DST_DIR)
	[ -r $(BAK_LOCK) ] && exit
	for f in $(RC_INCLUDE) $(RC_DEPENDS); do
		src_file=${DST_DIR}/.$$f
		dst_file=${BAK_DIR}/.$$f
		[ -r $$src_file ] && cp -fa $$src_file $$dst_file || > $$dst_file
	done && touch ${BAK_LOCK}

.ONESHELL:
restore: $(BAK_LOCK) |$(BAK_DIR) $(DST_DIR)
	for f in $(RC_INCLUDE) $(RC_DEPENDS); do
		src_file=${BAK_DIR}/.$$f
		dst_file=${DST_DIR}/.$$f
		[ -r $$src_file ] && [ -h $$dst_file ] && unlink $$dst_file
		[ -r $$src_file ] && cp -a $$src_file $$dst_file
	done && rm ${BAK_LOCK}
