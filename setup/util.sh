#!/usr/bin/env bash
#
# util.sh is used to make the install script readable and easier.
# Inspired by https://github.com/alrra/dotfiles.

declare -r NORMAL="\e[0m"
declare -r RED="\e[31m"
declare -r GREEN="\e[32m"
declare -r YELLOW="\e[33m"
declare -r BLUE="\e[34m"

info() {
	printf "%b" "${@}"
}

success() {
	printf "[%bDone%b] %b" "${GREEN}" "${NORMAL}" "${@}"
}

confirm() {
	printf "[%b\u279c%b] %b" "${YELLOW}" "${NORMAL}" "${@}"
}

fail() {
	printf "[%bFail%b] %b" "${RED}" "${NORMAL}" "${@}"
}

error_info_head() {
	printf "%bError Information:\n" "${RED}"
}

error_info_end() {
	printf "%b" "${NORMAL}"
}

error_in_log() {
	local log_file msg
	msg=$1; log_file=$2

	fail "${msg}\n"
	error_info_head
	sed -e 's/\(^.*\)/  \1/g' < "${log_file}"
	error_info_end
}

clear_line() {
	printf "%b" "\r"
}

ask() {
	local content

	content=$1; confirm "${content} (y/n)"
	read -r -n 1; echo
	[[ "$REPLY" =~ ^[Nn]$ ]]
}

which_os() {
	local kernel os

	kernel="$(uname -s)"; os="Unknow"
	if [[ "${kernel}" == "Darwin" ]]; then
		os="MacOS"
	elif [[ "${kernel}" == "Linux" ]] && [[ -f "/etc/centos-release" ]]; then
		os="Centos"
	elif [[ "${kernel}" == "Linux" ]] && [[ -f "/etc/lsb-release" ]]; then
		os="Ubuntu"
	fi
	echo "${os}"
}

command_exists() {
	local cmd_name code

	cmd_name=$1
	set +e
	command -v "${cmd_name}" > /dev/null 2>&1
	code=$?
	set -e

	return ${code}
}

spinner() {
	local frequence frames len_of_frames
	frequence=0.05; frames='/-\|'; len_of_frames="${#frames}"

	local i status
	i=0

	while :; do
		i=$(( ++i % len_of_frames ))
		status="${BLUE}[${frames:i:1}] ${msg} ${NORMAL}"

		info "${status}"
		sleep ${frequence}
		clear_line
	done
}

do_it() {
	local cmd msg log_file code spinner_pid

	cmd=$1; msg=$2; log_file=$(mktemp)

	spinner "${msg}" &
	spinner_pid=$!
	disown

	set +e
	${cmd} > /dev/null 2> "${log_file}"
	code=$?
	set -e

	kill ${spinner_pid} > /dev/null 2>&1
	wait ${spinner_pid}
	clear_line

	if [[ "${code}" -ne 0 ]]; then
		error_in_log "${msg}" "${log_file}"
	else
		success "${msg}\n"
	fi

	rm -rf "${log_file}"
}

mk_link() {
	local src_file dest_file res

	src_file=$1; dest_file=$2
	res="make link ${src_file} -> ${dest_file}\n"

	[[ -e "${dest_file}" ]] \
		&& [[ "$(readlink -f "${dest_file}")" == "${src_file}" ]] \
		&& success "${res}" \
		&& return 0

	[[ -e "${dest_file}" ]] \
		&& ask "${dest_file} already exists. Do you want to overwrite it?"\
		&& fail "${res}" \
		&& return 0

	ln -sf "${src_file}" "${dest_file}"
	success "${res}"
}

# vim: set filetype=sh :
