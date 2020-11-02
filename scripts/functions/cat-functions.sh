#!/bin/sh

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
