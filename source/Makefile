.PHONY: clean
SRC_DIR=~

$(DRC_DIR)/vim_plugin: $(DRC_DIR)/vimrc

vim_plugin: vimrc
	> $@ && grep '^\s\+Plugin' $< > $@

clean:
	rm $$(ls|grep -v Makefile)

%: $(SRC_DIR)/.%
	cp $< $@
