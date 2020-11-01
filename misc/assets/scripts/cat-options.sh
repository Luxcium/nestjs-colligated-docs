#!/bin/sh

function getSTMP8_() {
  echo -n Z$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])x
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

_pTMP_PATH="/tmp/docs.nestjs.com-${_snDATEu}-${_snTIMEshortu}-${_snSTMP4a}"
_pTMP_PATH_flags="${_pTMP_PATH}/flags-${_snSTMP4a}"

gh repo clone nestjs/docs.nestjs.com ${_pTMP_PATH}

_pASSETS="${_pTMP_PATH}/src/assets"
_pCONTENT="${_pTMP_PATH}/content"

_imgpath="./content/assets/svg"
_FILENAME_path="/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts"
_FILENAME="random.md"
_output_path="${_FILENAME_path}/${_FILENAME}"
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

function imagetag_() {
  echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='${_imgid}' />"
}

function imganchortag_() {
  _anchorhash="#${_anchorid}"
  echo -n "<a href='${_anchorpage}${_anchorhash}'>$(imagetag_)</a>"
}

function imagetag_logo_small_() {
  _imgid="${_anchorid_current}"
  _imgsrc="/logo-small.svg"
  _anchorid="top"
  _imgalt="Nest JS Small Logo"
  _anchorpage="${_long_Url_site}${_short_Url_site}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevron_up_() {
  _imgsrc="/chevron-up.svg"
  _imgalt="Go top section"
  _anchorid="${_subanchorid_top}"
  _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevron_left_() {
  _imgsrc="/chevron-left.svg"
  _imgalt="Go previous sub-section"
  _anchorid="${_subanchorid_previous}"
  _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevron_right_() {
  _imgsrc="/chevron-right.svg"
  _imgalt="Go next sub-section"
  _anchorid="${_subanchorid_next}"
  _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevrons_up_() {
  _imgsrc="/chevrons-up.svg"
  _imgalt="Go top"
  _anchorid="${_sectionanchorid_top}"
  _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevrons_left_() {
  _imgsrc="/chevrons-left.svg"
  _imgalt="Go previous section"
  _anchorid="${_sectionanchorid_previous}"
  _anchorpage="${_long_Url}${_short_Url}"
  echo -n "$(imganchortag_)"
}

function imagetag_chevrons_right_() {
  _imgsrc="/chevrons-right.svg"
  _imgalt="Go next section"
  _anchorid="${_sectionanchorid_next}"
  _anchorpage="${_long_Url}${_short_Url}"
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

first_set_
echo "" >/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/random.md
function setSection_() {
  # _short_Url="${1}"
  _short_Url_site="${1}"
  _sectionText="${2}"
  _sectionanchorid_top="$(get_sec_top_)"
  _sectionanchorid_previous="$(get_sec_previous_)"
  _anchorid_current="$(get_sec_current_)"
  _sectionanchorid_next="$(get_sec_next_)"
  _imgwidth=${_imgwidth3}
  echo $(create_section_) >>"${_output_path}"
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
  echo "" >>"${_output_path}"
  echo -n $(create_sub_section_) >>"${_output_path}"
  echo "" >>"${_output_path}"
  echo "" >>"${_output_path}"
  cat "./${3}" >>"${_output_path}"
  echo "" >>"${_output_path}"

  set_nxt_sub_links_
}

# echo ""
# getSTMP8_
# echo ""
# getSTMP4_
# echo ""
# getSTMP6_
# echo ""
# getSTMP8a_
# echo ""
# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo_small_
# echo ""
# imagetag_chevron_up_
# echo ""
# imagetag_chevron_left_
# echo ""
# imagetag_chevron_right_
# echo ""
# imagetag_chevrons_up_
# echo ""
# imagetag_chevrons_left_
# echo ""
# imagetag_chevrons_right_
# echo ""
# echo ""
# echo ""
# echo ""
# # create_section_
# setSection_ "_short_Url" "_sectionText"
# echo ""
# echo ""
# echo ""
# # create_sub_section_
# setSubSection_ "_short_Url" "_sectionText"
