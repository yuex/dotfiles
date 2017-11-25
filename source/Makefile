.PHONY: clean emacs.d
SRC_DIR=~

vim_plugin: vimrc
	> $@ && grep '^\s\+Plugin' $< > $@

clean:
	rm $$(ls|grep -v Makefile)

emacs.d: init.el

.ONESHELL:
init.el: $(SRC_DIR)/.emacs.d/init.el
	cp $< init.el

%: $(SRC_DIR)/.%
	cp $< $@
