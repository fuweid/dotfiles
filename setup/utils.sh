#!/usr/bin/env bash
#
# utils.sh is used to make the install script readable and easier.
# Inspired by https://github.com/alrra/dotfiles.

# exit immediately if non-zero status
set -o errexit

# exit immediately if unset variable
set -o nounset

# exit immediately if nono-zero status in pipe
set -o pipefail

# set color and format
CLEAR_LINE="printf \\r"
SETCOLOR_SUCCESS="printf \\e[32m"
SETCOLOR_FAIFURE="printf \\e[31m"
SETCOLOR_WARNING="printf \\e[33m"
SETCOLOR_NORMAL="printf  \\e[0m"

# logging helper
__echo_success() {
  $CLEAR_LINE
  echo -n "["
  $SETCOLOR_SUCCESS
  echo -n " OK "
  $SETCOLOR_NORMAL
  echo -n "] "
}

__echo_failure() {
  $CLEAR_LINE
  echo -n "["
  $SETCOLOR_FAIFURE
  echo -n "FAIL"
  $SETCOLOR_NORMAL
  echo -n "] "
}

__echo_warning() {
  $CLEAR_LINE
  echo -n "["
  $SETCOLOR_WARNING
  echo -n "WARN"
  $SETCOLOR_NORMAL
  echo -n "] "
}

# log that something successed
success() {
  __echo_success && echo "${1}"
}

# log that something failure
failure() {
  __echo_failure && echo "${1}"
}

# log a warning
warning() {
  __echo_warning && echo "${1}"
}

# ask for reply
ask() {
  __echo_warning && echo -n "${1}"
  read -r -n 1
  echo
  [[ "$REPLY" =~ ^[Nn]$ ]] && return 0 || return 1
}

# show spinner for time-consuming background job
__spinner() {
  local freq frames len_of_frames pid msg i

  frames='/-\|'
  len_of_frames="${#frames}"
  freq=0.1

  pid=$1
  msg=$2

  i=0
  # show spinner while the job is still running
  while kill -0 "${pid}" &> /dev/null; do
    echo -n "[${frames:i++%len_of_frames:1}] ${msg}"
    sleep ${freq}
    $CLEAR_LINE
  done
}

# log that something failure and why
__failure_messages() {
  local log_file message

  message=$1
  log_file=$2

  failure "${message}"
  $SETCOLOR_FAIFURE
  cat "${log_file}"
  $SETCOLOR_NORMAL
}

# clean up subprocesses
__cleanup_all_subprocesses() {
  local pid

  for pid in $(jobs -p); do
    kill "${pid}"
    wait "${pid}"
  done
}

# wrap time-consuming job
do_it() {
  local cmd msg pid log_file

  cmd=$1
  msg=$2
  log_file=$(mktemp -t 'dotfile.XXXXX')

  # clean up subprocesses when quit
  trap '__cleanup_all_subprocesses' EXIT

  # show error messages if there is something wrong
  trap '__failure_messages "${msg}" "${log_file}"; rm -rf "${log_file}"' ERR

  # run commands in background
  sh -c "${cmd}" > /dev/null 2> "${log_file}" &
  pid=$!

  # show spinner and wait the background job
  __spinner "${pid}" "${msg}"
  wait "${pid}"

  success "${msg}"
  rm -rf "${log_file}"
}

# wrap ln command, ask for reply if neccessary
mk_link() {
  local src_file dest_file res

  src_file=$1
  dest_file=$2
  res="make link ${src_file} -> ${dest_file}"

  [[ -e "${dest_file}" ]] \
    && ask "${dest_file} already exists. Do you want to overwrite it?"\
    && failure "${res}" \
    && return 0

  ln -sf "${src_file}" "${dest_file}"
  success "${res}"
}

# insert line into file if the line doesn't has the line
insert_line() {
  local file line line_num

  file=$1
  line=$2

  [[ -f "${file}" ]] || touch "${file}"
  line_num="$(grep -nF "${line}" "${file}" || echo)"

  if [[ ! -n "${line_num}" ]]; then
    echo >> "${file}"
    echo "${line}" >> "${file}"
  fi

  success "insert '${line}' line into ${file}"
}
