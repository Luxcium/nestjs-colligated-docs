#!/bin/sh

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
