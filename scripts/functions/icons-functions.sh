#!/bin/sh

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
