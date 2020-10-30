#!/bin/sh

snDATE=$(date +%y%m%d)
snDATEu=$(date --utc +%y%m%d)
snTIME=$(date +%H%M%S%Z)
snTIMEu=$(date --utc +%H%M%S%Z)
snEPOCH=$(date +%s)
snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
pASSETS="${pTMP_PATH}/src/assets"
pCONTENT="${pTMP_PATH}/content"

sect1_="# "
sect2_="## "
sect3_="### "
sect4_="#### "

_imgwidth1=30
_imgwidth2=25
_imgwidth3=20

function getSTMP8() {
  echo -n Z$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])x
}

function getSTMP4() {
  echo -n $(sha224hmac <<<$(date +%D%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
}

function getSTMP6() {
  echo -n \#$(sha224hmac <<<$(date +%D%s%N) | cut -c -6 | tr \[a-z\] \[A-Z\])
}

_innerspawn="."
function getRandomSpan() {
  echo -n "<span style='color:$(getSTMP6)'> ${_innerspawn} </span>"
}

function getSTMP8a() {
  echo -n "$(getSTMP4)-$(getSTMP4)x"

}

pTMP_PATH="/tmp/docs.nestjs.com-$(getSTMP8a)"

_imgpath="../svg"
_iconpath="../svg"

_logosmall="/logo-small.svg"

_icon1up="/chevrons-up.svg"
_icon1lft="/chevrons-left.svg"
_icon1rgh="/chevrons-right.svg"

_icon2up="/chevron-up.svg"
_icon2lft="/chevron-left.svg"
_icon2rgh="/chevron-right.svg"

function imagetag_() {
  echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='${_imgid}' />"
}

function imganchortag_() {
  _anchorinner="$(imagetag_)"
  _anchorhash="#${_anchorid}"
  echo -n "<a href='${_anchorpage}${_anchorhash}'>${_anchorinner}</a>"
}

function imagetag_logo_small() {
  _imgid=$(getSTMP8)
  _imgsrc="${_logosmall}"
  _anchorid="top"
  _imgalt="Nest JS Small Logo"
  _anchorpage="${long_Url_}${short_Url}"
  imganchortag_
}

function imagetag_chevrons_up() {
  _imgsrc="${_icon1up}"
  _imgid="${_anchorid_current}"
  _imgalt="Go to top"
  imganchortag_
}

function imagetag_chevrons_left() {
  _imgid=$(getSTMP8)
  _imgsrc="${_icon1lft}"
  _imgalt="Previous section"
  imganchortag_
}

function imagetag_chevrons_right() {
  _imgid=$(getSTMP8)
  _imgsrc="${_icon1rgh}"
  _imgalt="Next section"
  imganchortag_
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



# _create_sub_section
# _imgpath
# _imgsrc
# _imgwidth
# _imgalt
# _imgidtype
# _imgid
# _anchorid
# _anchorpage
# _anchorhash
# _anchorinner
# _logosmall
# _icon1up
# _icon1lft
# _icon1rgh
# _icon2up
# _icon2lft
# _icon2rgh
# sect2_
# sect3_

# imagetag_
# imagetag_chevrons_left
# imagetag_chevrons_right
# imagetag_chevrons_up
# imagetag_logo_small
# imagetag_chevron_left
# imagetag_chevron_right
# imagetag_chevron_up

# echo ""
# echo ""
# getSTMP8
# echo ""
# getSTMP8a
# echo ""
# getSTMP4
# echo ""
# getSTMP6
# echo ""
# snapSTMP8a="$(getSTMP8a)"
