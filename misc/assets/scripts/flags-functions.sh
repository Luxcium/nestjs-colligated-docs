#!/bin/sh

# _pTMP_PATH_flags_temporaire=""
_pTMP_PATH_flags="${_pTMP_PATH}/flags"

_flg_sec_top="${_pTMP_PATH_flags}/sec_top.txt"
_flg_sec_previous="${_pTMP_PATH_flags}/sec_previous.txt"
_flg_sec_current="${_pTMP_PATH_flags}/sec_current.txt"
_flg_sec_next="${_pTMP_PATH_flags}/sec_next.txt"

_flg_sub_top="${_pTMP_PATH_flags}/sub_top.txt"
_flg_sub_previous="${_pTMP_PATH_flags}/sub_previous.txt"
_flg_sub_current="${_pTMP_PATH_flags}/sub_current.txt"
_flg_sub_next="${_pTMP_PATH_flags}/sub_next.txt"

mkdir -p "${_pTMP_PATH_flags}"

touch "${_flg_sec_top}"
touch "${_flg_sec_previous}"
touch "${_flg_sec_current}"
touch "${_flg_sec_next}"
touch "${_flg_sub_top}"
touch "${_flg_sub_previous}"
touch "${_flg_sub_current}"
touch "${_flg_sub_next}"

function set_sec_top_() {
  echo -n "${1}" >"${_flg_sec_top}"
}

function set_sec_previous_() {
  echo -n "${1}" >"${_flg_sec_previous}"
}

function set_sec_current_() {
  echo -n "${1}" >"${_flg_sec_current}"
}

function set_sec_next_() {
  echo -n "${1}" >"${_flg_sec_next}"
}

function set_sub_top_() {
  echo -n "${1}" >"${_flg_sub_top}"
}

function set_sub_previous_() {
  echo -n "${1}" >"${_flg_sub_previous}"
}

function set_sub_current_() {
  echo -n "${1}" >"${_flg_sub_current}"
}

function set_sub_next_() {
  echo -n "${1}" >"${_flg_sub_next}"
}

function get_sec_top_() {
  cat "${_flg_sec_top}"
}

function get_sec_previous_() {
  cat "${_flg_sec_previous}"
}

function get_sec_current_() {
  cat "${_flg_sec_current}"
}

function get_sec_next_() {
  cat "${_flg_sec_next}"
}

function get_sub_top_() {
  cat "${_flg_sub_top}"
}

function get_sub_previous_() {
  cat "${_flg_sub_previous}"

}
function get_sub_current_() {
  cat "${_flg_sub_current}"
}

function get_sub_next_() {
  cat "${_flg_sub_next}"
}

function first_set_() {
  set_sec_top_ "top"
  set_sec_previous_ "top"
  set_sec_current_ "$(getSTMP8_)"
  set_sec_next_ "$(getSTMP8_)"
  set_sub_top_ "top"
  set_sub_previous_ "top"
  set_sub_current_ "$(getSTMP8_)"
  set_sub_next_ "$(getSTMP8_)"
}

function set_nxt_sec_links_() {
  set_sec_top_ "$(get_sec_top_)"
  set_sec_previous_ "$(get_sec_current_)"
  set_sec_current_ "$(get_sec_next_)"
  set_sec_next_ "$(getSTMP8_)"
}

function set_nxt_sub_links_() {
  set_sub_top_ "$(get_sec_previous_)"
  set_sub_previous_ "$(get_sub_current_)"
  set_sub_current_ "$(get_sub_next_)"
  set_sub_next_ "$(getSTMP8_)"
}
