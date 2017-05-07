NAME := Wei Fu
EMAIL := fhfuwei@163.com
MAKEFLAGS += --silent

install: setup_vim \
	setup_tmux \
	setup_bash \
	setup_git

setup_vim:
	./setup/setup_vim

setup_tmux:
	./setup/setup_tmux

setup_bash:
	./setup/setup_bash

setup_git:
	./setup/setup_git

setup_gdb:
	./setup/setup_gdb

test:
	./test/shell_linter

.PHONY: install \
		setup_tmux \
		setup_vim \
		setup_bash \
		setup_git \
		setup_gdb \
		test
