#!/bin/sh

_base_work_path="/home/luxcium/.local/src/nestjs-colligated-docs"
_scripts_dir="${_base_work_path}/scripts"
_functions_dir="${_scripts_dir}/functions"
# /home/luxcium/.local/src/nestjs-colligated-docs/scripts/functions

function getSTMP8_() {
  echo -n Z-$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
}

function getSTMP4_() {
  echo -n $(sha224hmac <<<$(date +%D%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
}

function getSTMP6_() {
  echo -n \#$(sha224hmac <<<$(date +%D%s%N) | cut -c -6 | tr \[a-z\] \[A-Z\])
}

function getSTMP8a_() {
  echo -n "$(getSTMP4_)-$(getSTMP4_)x"
}

_snDATE=$(date +%m%d)
_snDATEy=$(date +%y%m%d)
_snDATEu=$(date --utc +%m%d)
_snDATEyu=$(date --utc +%y%m%d)
_snTIME=$(date +%H%M%S%Z)
_snTIMEu=$(date --utc +%H%M%S%Z)
_snTIMEshortu=$(date --utc +%H%M%S)
_snEPOCH=$(date +%s)
_snSTMP8=$(getSTMP8_)
_snSTMP4a=$(getSTMP4_)
_snSTMP4b=$(getSTMP4_)
_snapSTMP8a="$(getSTMP8a_)"

_tmp_work_path="/tmp/docs.nestjs.com-${_snDATEu}-${_snTIMEshortu}-$(getSTMP4_)"
_tmp_flags_path="${_tmp_work_path}/flags-$(getSTMP4_)"
_tmp_out_path="${_tmp_work_path}/out-$(getSTMP4_)"
_tmp_assets_path="${_tmp_work_path}/src/assets"
_tmp_content_path="${_tmp_work_path}/content"

_pTMP_PATH="${_tmp_work_path}"
_pTMP_PATH_flags="${_tmp_flags_path}"
_pASSETS="${_tmp_assets_path}/src/assets"
_pCONTENT="${_tmp_content_path}/content"

_imgpath="./content/assets/svg"
_FILENAME_path="/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts"
_FILENAME="random.md"
_output_path_temp="${_FILENAME_path}/${_FILENAME}"
_short_Url="${_FILENAME}"

_pTMP_content="${_pTMP_PATH}/content"

_long_Url_site="https://docs.nestjs.com/"

_sect1="# "
_sect2="## "
_sect3="### "
_sect4="#### "

_imgwidth1=30
_imgwidth2=25
_imgwidth3=20

# _pTMP_PATH="/tmp/docs.nestjs.com-$(getSTMP8a_)"

_imgpath="../svg"
_iconpath="../svg"

# !! FETCHING FROM THE REPO https://github.com/nestjs/docs.nestjs.com.git
gh repo clone nestjs/docs.nestjs.com ${_pTMP_PATH}

function imagetag_() {
  echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='${_imgid}' />"
}

function imganchortag_() {
  local _anchorhash="#${_anchorid}"
  echo -n "<a href='${_anchorpage}${_anchorhash}'>$(imagetag_)</a>"
}

function itemsanchortag_() {
  local _anchorhash="#${_anchorid}"
  echo -n "<a href='${_anchorpage}${_anchorhash}'>${_item_value}</a>"
}

function itemtag_generate_() {
  local _item_value=""
  local _anchorid="${_anchorid_current}"
  local _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(itemsanchortag_)"
}

function imagetag_logo_small_() {
  local _imgid="${_anchorid_current}"
  local _imgsrc="/logo-small.svg"
  local _anchorid="top"
  local _imgalt="Nest JS Small Logo"
  local _anchorpage="${_long_Url_site}${_short_Url_site}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevrons_up_() {
  local _imgid="chevrons_up_$(getSTMP8_)"
  local _imgsrc="/chevrons-up.svg"
  local _imgalt="Go top"
  local _anchorid="${_sectionanchorid_top}"
  local _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevrons_left_() {
  local _imgid="chevrons_left_$(getSTMP8_)"
  local _imgsrc="/chevrons-left.svg"
  local _imgalt="Go previous section"
  local _anchorid="${_sectionanchorid_previous}"
  local _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevrons_right_() {
  local _imgid="chevrons_right_$(getSTMP8_)"
  local _imgsrc="/chevrons-right.svg"
  local _imgalt="Go next section"
  local _anchorid="${_sectionanchorid_next}"
  local _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevron_up_() {
  local _imgid="chevron_up_$(getSTMP8_)"
  local _imgsrc="/chevron-up.svg"
  local _imgalt="Go top section"
  local _anchorid="${_subanchorid_top}"
  local _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevron_left_() {
  local _imgid="chevron_left_$(getSTMP8_)"
  local _imgsrc="/chevron-left.svg"
  local _imgalt="Go previous sub-section"
  local _anchorid="${_subanchorid_previous}"
  local _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevron_right_() {
  local _imgid="chevron_right_$(getSTMP8_)"
  local _imgsrc="/chevron-right.svg"
  local _imgalt="Go next sub-section"
  local _anchorid="${_subanchorid_next}"
  local _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

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
  set_sec_current_ "$(getSTMP4_)"
  set_sec_next_ "$(getSTMP4_)"
  set_sub_top_ "top"
  set_sub_previous_ "top"
  set_sub_current_ "$(getSTMP4_)"
  set_sub_next_ "$(getSTMP4_)"
}

function set_nxt_sec_links_() {
  set_sec_top_ "$(get_sec_top_)"
  set_sec_previous_ "$(get_sec_current_)"
  set_sec_current_ "$(get_sec_next_)"
  set_sec_next_ "$(getSTMP4_)"
}

function set_nxt_sub_links_() {
  set_sub_top_ "$(get_sec_previous_)"
  set_sub_previous_ "$(get_sub_current_)"
  set_sub_current_ "$(get_sub_next_)"
  set_sub_next_ "$(getSTMP4_)"
}

_imgsrc="_imgsrc"
_imgwidth="20"
_imgidtype="_imgidtype"
_long_Url=""
# _short_Url="README.md"
_long_Url_site="https://docs.nestjs.com/"
# _short_Url_site="will-be-calculated"
function create_section_() {
  echo -n ${_sect2}$(imagetag_chevrons_left_)$(imagetag_chevrons_right_) ${_sectionText} $(imagetag_chevrons_up_) $(imagetag_logo_small_)
}

# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="15"
_imgidtype="_imgidtype"
_long_Url=""
_long_Url_site="https://docs.nestjs.com/"
# _short_Url_site="will-be-calculated"
function create_sub_section_() {
  echo -n ${_sect3}$(imagetag_chevron_left_)$(imagetag_chevron_right_) ${_sectionText} $(imagetag_chevron_up_) $(imagetag_logo_small_)

}

function create_section_list_item_() {
  echo -n " - "
}

first_set_
_output_file_path="${_tmp_out_path}/output_file-$(getSTMP4_)"
_output_path_temp_main="${_tmp_out_path}/output_temp_main-$(getSTMP4_)"
_output_path_temp="${_tmp_out_path}/output_temp-$(getSTMP4_)"

echo "" >"${_test_file_out}"
echo "" >"${_output_file_path}"
echo "" >"${_output_path_temp_main}"
echo "" >"${_output_path_temp}"

function setSection_() {
  # _short_Url="${1}"
  _short_Url_site="${1}"
  _sectionText="${2}"
  _sectionanchorid_top="$(get_sec_top_)"
  _sectionanchorid_previous="$(get_sec_previous_)"
  _anchorid_current="$(get_sec_current_)"
  _sectionanchorid_next="$(get_sec_next_)"
  _imgwidth=${_imgwidth3}
  echo $(create_section_) >>"${_output_path_temp_main}"
  echo "" >>"${_output_path_temp_main}"
  set_nxt_sec_links_
}

function setSubSection_() {
  _short_Url_site="${1}"
  _sectionText="${2}"
  _subanchorid_top="$(get_sub_top_)"
  _subanchorid_previous="$(get_sub_previous_)"
  _anchorid_current="$(get_sub_current_)"
  _subanchorid_next="$(get_sub_next_)"
  _imgwidth=${_imgwidth3}
  echo "" >>"${_output_path_temp}"
  echo -n "$(create_sub_section_)" >>"${_output_path_temp}"
  echo "" >>"${_output_path_temp}"
  echo "" >>"${_output_path_temp}"
  cat "./${3}" >>"${_output_path_temp}"
  echo "" >>"${_output_path_temp}"
  # echo -n "$(somefunctionname_)" >>_output_path_temp_main
  set_nxt_sub_links_
}
