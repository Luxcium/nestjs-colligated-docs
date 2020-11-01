#!/bin/sh


function _create_section() {
  echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
}

function _create_sub-section() {
  echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

}

function imagetag_chevron_up() {
  _imgsrc="${_icon2up}"
  _imgid="${_anchorid_current}"
  _imgalt="Go to top section"
  _anchorid=${_anchorid_top}
  imganchortag_
}

function imagetag_chevron_left() {
  _imgid=$(getSTMP8)
  _imgsrc="${_icon2lft}"
  _imgalt="Previous sub-section"
  _anchorid=${_anchorid_previous}
  imganchortag_
}

function imagetag_chevron_right() {
  _imgid=$(getSTMP8)
  _imgsrc="${_icon2rgh}"
  _imgalt="Next sub-section"
  _anchorid=${_anchorid_next}
  imganchortag_
}

source /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/flags-functions.sh


function _create_section() {
  _imgwidth=${_imgwidth2}
  _anchorid_current="${_anchorid_current}"
  _anchorid_top="${_anchorid_current}"
  _anchorid_previous="${_anchorid_current}"
  _anchorid_next="${_anchorid_current}"
  echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) ${_sectionText} $(imagetag_chevrons_up)
}

function _create_sub_section() {
  _imgwidth=${_imgwidth3}
  _anchorid_current="${_subanchorid_current}"
  _anchorid_top="${_subanchorid_current}"
  _anchorid_previous="${_subanchorid_current}"
  _anchorid_next="${_subanchorid_current}"
  echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) ${_sectionText} $(imagetag_logo_small) $(imagetag_chevron_up)
}
