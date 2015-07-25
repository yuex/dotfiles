.PHONY: all clean

all:

clean:
	rm $$(ls |grep -v Makefile)

vimrc: ~/.vimrc
	cp $< $@
	grep '^\s*Plugin' $@ |sed 's/^\s*//g' > VIM_PLUGIN

%: ~/.%
	cp $< $@
