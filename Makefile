CONFIG=vimrc bashrc zshrc tmux.conf nethackrc
SRC_DIR=~
#SHELL=/bin/bash

all: clean $(CONFIG)
	@echo "ln $(CONFIG)..."

$(CONFIG):
	@ln ${SRC_DIR}/.$@ $@

# use $$ prefix to pass parameter to bash to interpret
# bash script must be written within one line, forget this never
clean:
	@for i in $(CONFIG); do \
		if [ -e $$i ]; then \
			unlink $$i; \
		fi; \
	done
	@echo "unlink $(CONFIG)..."

.PHONY: all clean
