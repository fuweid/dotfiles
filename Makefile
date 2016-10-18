NAME := Wei Fu
EMAIL := wei.fu.1218@gmail.com
MAKEFLAGS += --silent

install: install_dotfiles

install_dotfiles: setup/install_dotfiles
	./setup/install_dotfiles

clean: clean_dotfiles

clean_dotfiles: setup/clean_dotfiles
	./setup/clean_dotfiles

.PHONY: install \
	install_dotfiles \
	clean \
	clean_dotfiles
