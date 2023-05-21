set -e

function _append_line() {
  local _file _line
  _file=$1
  _line=$2
  if grep -qxF "${_line}" "${_file}"; then
    echo "${_file} already contains ${_line}"
  else
    echo "Adding ${_line} to ${_file}"
    echo "${_line}" >> "${_file}"
  fi
}

function _check_root() {
  if test `id -u` != "0"; then
    echo "Must be root" >&2
    exit 1
  fi
}

function _get_target_user() {
  _target_user="${DOAS_USER:-${SUDO_USER}}"
  if test -z "${_target_user}"; then
    echo "DOAS_USER nor SUDO_USER set, skipping user config." >&2
    echo "Make sure to run this script again using doas/sudo." >&2
    echo >&2
    return 1
  else
    echo "${_target_user}"
    return 0
  fi
}

function _insert_mod() {
  echo "Enabling $1"
  modprobe "$1"
  _append_line /etc/modules "$1"
}

function _openrc_enable() {
  echo "Configuring $1"
  rc-update add "$1"
  rc-service "$1" start
}

