.PHONY: clean
SRC_DIR=~

vim_plugin: vimrc
	> $@ && grep '^\s\+Plugin' $< > $@

clean:
	rm $$(ls|grep -v Makefile)

.ONESHELL:
emacs.d: $(SRC_DIR)/.emacs.d/init.el
	cp $< init.el

%: $(SRC_DIR)/.%
	cp $< $@
