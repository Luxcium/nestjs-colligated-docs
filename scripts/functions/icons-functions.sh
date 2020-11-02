#!/bin/sh

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

source "/home/luxcium/.local/src/nestjs-colligated-docs/scripts/functions/imagetag-chevrons.sh"
