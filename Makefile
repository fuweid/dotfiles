NAME := Wei Fu
EMAIL := fuweid89@gmail.com
MAKEFLAGS += --silent

install: setup_vim \
	setup_nvim \
	setup_tmux \
	setup_git \
	setup_gdb \
	setup_zsh

setup_vim:
	./setup/setup_vim

setup_nvim:
	./setup/setup_nvim

setup_tmux:
	./setup/setup_tmux

setup_git:
	./setup/setup_git

setup_gdb:
	./setup/setup_gdb

setup_zsh:
	SHELL=/bin/zsh ./setup/setup_zsh

setup_i3wm:
	./setup/setup_i3wm

setup_golang:
	./setup/setup_golang

setup_dockerce:
	./setup/setup_dockerce

setup_k8s:
	./setup/setup_k8s

clone_working_projects:
	./setup/clone_working_projects

install_tools:
	./setup/install_tools

test:
	./test/shell_linter

.PHONY: install \
		setup_tmux \
		setup_vim \
		setup_nvim \
		setup_git \
		setup_gdb \
		setup_zsh \
		setup_golang \
		setup_dockerce \
		setup_k8s \
		clone_working_projects \
		install_tools \
		test
