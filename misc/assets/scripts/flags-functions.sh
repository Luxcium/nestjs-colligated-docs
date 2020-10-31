#!/bin/sh

function set_sec_top() {
  mkdir -p "${pTMP_PATH_flags}"
  echo -n "${1}" >"${flg_sec_top}"

}
function set_sec_previous() {
  mkdir -p "${pTMP_PATH_flags}"
  echo -n "${1}" >"${flg_sec_previous}"

}
function set_sec_current() {
  mkdir -p "${pTMP_PATH_flags}"
  echo -n "${1}" >"${flg_sec_current}"

}
function set_sec_next() {
  mkdir -p "${pTMP_PATH_flags}"
  echo -n "${1}" >"${flg_sec_next}"

}
function set_sub_top() {
  mkdir -p "${pTMP_PATH_flags}"
  echo -n "${1}" >"${flg_sub_top}"

}
function set_sub_previous() {
  mkdir -p "${pTMP_PATH_flags}"
  echo -n "${1}" >"${flg_sub_previous}"

}
function set_sub_current() {
  mkdir -p "${pTMP_PATH_flags}"
  echo -n "${1}" >"${flg_sub_current}"

}
function set_sub_next() {
  mkdir -p "${pTMP_PATH_flags}"
  echo -n "${1}" >"${flg_sub_next}"

}

function get_sec_top() {
  cat "${flg_sec_top}"

}
function get_sec_previous() {
  cat "${flg_sec_previous}"

}
function get_sec_current() {
  cat "${flg_sec_current}"

}
function get_sec_next() {
  cat "${flg_sec_next}"

}
function get_sub_top() {
  cat "${flg_sub_top}"

}
function get_sub_previous() {
  cat "${flg_sub_previous}"

}
function get_sub_current() {
  cat "${flg_sub_current}"

}
function get_sub_next() {
  cat "${flg_sub_next}"

}
