NAME := Wei Fu
EMAIL := wei.fu.1218@gmail.com
MAKEFLAGS += --silent

install: setup_vim \
	setup_tmux \
	setup_bash

setup_vim:
	./setup/setup_vim

setup_tmux:
	./setup/setup_tmux

setup_bash:
	./setup/setup_bash

test:
	./test/shell_linter

.PHONY: install \
		setup_tmux \
		setup_vim \
		setup_bash \
		test
