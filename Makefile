DST_DIR = ~
#DST_DIR=test
# VPATH = src:../headers to search src and ../headers
# or vpath %.h ../headers:/usr/include for searching files of specific pattern
# but not suitable to this case
DRC_DIR = source
LIB_DIR = lib
BAK_DIR=.backup
BAK_LOCK=${BAK_DIR}/lock


.PHONY: all compile remove \
	install backup restore \
	rc_module vim_plugin readme \
	$(RC_MODULE) \
	$(addprefix install-,$(RC_MODULE)) \
	$(addprefix plugin-,$(RC_MODULE)) \
	$(RC_DEPENDS) \
	$(DRC_DIR)/.rc_module \


RC_MODULE=bash nethack tmux zsh vim emacs
RC_INCLUDE=bashrc nethackrc tmux.conf zshrc vimrc emacs.d
RC_DEPENDS=dircolors-solarized oh-my-zsh vundle vim

all: 
	@echo 'RTFD :)'

readme: README.rst

compile: $(RC_INCLUDE) README.rst

.ONESHELL:
README.rst: README.template.rst rc_module vim_plugin
	eval "cat <<EOF
	$$(cat $<|sed 's/`/\\`/g')
	EOF" > README.rst

$(RC_INCLUDE) vim_plugin: |$(DRC_DIR)
	$(MAKE) -C $(DRC_DIR) $@

rc_module: $(DRC_DIR)/rc_module

.ONESHELL:
$(DRC_DIR)/rc_module: $(RC_INCLUDE) |$(DRC_DIR)
	echo $(RC_MODULE) |sed 's/ /\n/g' > $(DRC_DIR)/rc_module

remove: |$(DRC_DIR)
	$(MAKE) -C $(DRC_DIR) clean


install: backup $(RC_MODULE)

.ONESHELL:
backup: |$(BAK_DIR) $(DST_DIR)
	[ -f $(BAK_LOCK) ] && exit
	for f in $(RC_INCLUDE) $(RC_DEPENDS); do
		src_file=${DST_DIR}/.$$f
		dst_file=${BAK_DIR}/.$$f
		[ -e $$dst_file ] && rm -rf $$dst_file
		[ -e $$src_file ] && cp -fa $$src_file $$dst_file || > $$dst_file
	done && touch ${BAK_LOCK}

.ONESHELL:
restore: $(BAK_LOCK) |$(BAK_DIR) $(DST_DIR)
	for f in $(RC_INCLUDE) $(RC_DEPENDS); do
		src_file=${BAK_DIR}/.$$f
		dst_file=${DST_DIR}/.$$f
		[ -h $$dst_file ] && unlink $$dst_file
		[ -s $$src_file -a ! -e $$dst_file ] && cp -a $$src_file $$dst_file
		:
	done && rm ${BAK_LOCK}

$(RC_MODULE): %:backup install-%



define rm-and-link=
	dst=$(DST_DIR)/.$(<F)
	[ -e $$dst ] && rm -rf $$dst
	ln -fs $(abspath $<) $$dst
endef

define git-update=
	if [ ! -d $</.git ]; then
		git clone $$url $<
	else
		sh -c 'cd $< && git pull'
	fi
endef

.ONESHELL:
install-tmux: install-%:$(DRC_DIR)/%.conf
	$(rm-and-link)

.ONESHELL:
install-nethack install-zsh install-bash: install-%:$(DRC_DIR)/%rc plugin-% 
	$(rm-and-link)

.ONESHELL:
install-vim: install-%:$(DRC_DIR)/%rc plugin-%
	$(rm-and-link)
	vim -c 'PluginInstall' -c 'qa'

.ONESHELL:
install-emacs: $(DRC_DIR)/init.el
	dst=$(DST_DIR)/.emacs.d
	[ -e $$dst ] && rm -rf $$dst
	mkdir $$dst
	ln -fs $(abspath $<) $$dst/init.el

plugin-tmux plugin-nethack: ;

plugin-zsh: dircolors-solarized oh-my-zsh

plugin-bash: dircolors-solarized

plugin-vim: $(LIB_DIR)/vim vundle
	$(rm-and-link)

.ONESHELL:
dircolors-solarized: %:$(LIB_DIR)/%
	url=https://github.com/seebi/dircolors-solarized.git
	$(git-update)
	$(rm-and-link)

.ONESHELL:
oh-my-zsh: %:$(LIB_DIR)/%
	url=https://github.com/robbyrussell/oh-my-zsh.git
	$(git-update)
	$(rm-and-link)

.ONESHELL:
vundle: $(LIB_DIR)/vim/bundle/Vundle.vim
	url=https://github.com/gmarik/Vundle.vim.git
	$(git-update)

$(LIB_DIR)/%: |$(LIB_DIR)
	mkdir -p $@

$(LIB_DIR) $(BAK_DIR) $(DST_DIR) $(DRC_DIR):
	mkdir $@
