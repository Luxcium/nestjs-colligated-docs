#!/bin/sh

# !! gh repo clone nestjs/docs.nestjs.com ${_pTMP_PATH}
# !! cp -r /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/ ${_pTMP_PATH}/content
# !! mv ${_pASSETS} ${_pCONTENT}
# !! rm -fr "${_pCONTENT}/discover"
# !! rm -fr "${_pCONTENT}/recipes/swagger.md"
# !! builtin cd ${_pTMP_PATH}/content

echo "" >/home/luxcium/.localsrc/nestjs-colligated-docs/misc/assets/scripts/some-${randy001}.md

# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="_imgwidth"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
function imagetag_() {
  echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"
}

_anchorpage=""
_anchorid=""
function imganchortag_() {
  _anchorinner="$(imagetag_)"
  _anchorhash="#${_anchorid}"
  echo -n "<a href='${_anchorpage}${_anchorhash}'>${_anchorinner}</a>"
}
# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

_imgsrc="_imgsrc"
_imgwidth="20"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
function create_section_() {
  echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
}
## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="15"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
function create_sub-section_() {
  echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

}
### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# imagetag_chevron_right

echo ""
echo ""
echo ""
# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="20"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
_create_section
echo ""
echo ""
echo ""
# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="15"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
_create_sub-section
echo ""
echo ""
echo ""

#!/bin/sh

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

#+ ################################ source "./cat-functions.sh"
#+ ################################ source "./cat-functions.sh"
#+ ################################ source "./cat-functions.sh"
#+ ################################ source "./cat-functions.sh"

# function imagetag_() {
#   echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"
# }

# _anchorpage=""
# _anchorid=""
# function imganchortag_() {
#   _anchorinner="$(imagetag_)"
#   _anchorhash="#${_anchorid}"
#   echo -n "<a href='${_anchorpage}${_anchorhash}'>${_anchorinner}</a>"
# }

# function imagetag_logo-small() {
#   _imgsrc="${_logosmall}"
#   _imgalt="Nest JS Small Logo"
#   imganchortag_
# }

# function imagetag_chevrons_up() {
#   _imgsrc="${_icon1up}"
#   _imgalt="Go top"
#   imganchortag_
# }

# function imagetag_chevrons_left() {
#   _imgsrc="${_icon1lft}"
#   _imgalt="Previous section"
#   imganchortag_
# }

# function imagetag_chevrons_right() {
#   _imgsrc="${_icon1rgh}"
#   _imgalt="Next section"
#   imganchortag_
# }

# function imagetag_chevron_up() {
#   _imgsrc="${_icon2up}"
#   _imgalt="Go top section"
#   imganchortag_
# }

# function imagetag_chevron_left() {
#   _imgsrc="${_icon2lft}"
#   _imgalt="Previous sub-section"
#   imganchortag_
# }

# function imagetag_chevron_right() {
#   _imgsrc="${_icon2rgh}"
#   _imgalt="Next sub-section"
#   imganchortag_
# }

# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }

# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }

# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }
# ## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }
### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# echo "-->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Header.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Overview.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# imagetag_chevron_right
_imgpath="./content/assets/svg"
echo ""
echo ""
echo ""
# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="20"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
_create_section
echo ""
echo ""
echo ""
# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="15"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
_create_sub-section
echo ""
echo ""
echo ""

# snDATE=$(date +%y%m%d)
# snDATEu=$(date --utc +%y%m%d)
# snTIME=$(date +%H%M%S%Z)
# snTIMEu=$(date --utc +%H%M%S%Z)
# snEPOCH=$(date +%s)
# snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
# snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
# pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
# pASSETS="${pTMP_PATH}/src/assets"
# pCONTENT="${pTMP_PATH}/content"

# _width1=15
# _width2=20
# _width3=25

# _imgpath="./content/assets/svg/"
# _iconpath="./content/assets/svg/"

# _logosmall="/logo-small.svg"

# _icon1up="/chevrons-up.svg"
# _icon1lft="/chevrons-left.svg"
# _icon1rgh="/chevrons-right.svg"

# _icon2up="/chevron-up.svg"
# _icon2lft="/chevron-left.svg"
# _icon2rgh="/chevron-right.svg"

# sect1_="# "
# sect2_="## "
# sect3_="### "
# sect4_="#### "

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="_imgwidth"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# # gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

# mv ${pASSETS} ${pCONTENT}
# rm -fr "${pCONTENT}/discover"
# rm -fr "${pCONTENT}/recipes/swagger.md"

# FILENAME_="../README.md"

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# # gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

# mv ${pASSETS} ${pCONTENT}
# rm -fr "${pCONTENT}/discover"
# rm -fr "${pCONTENT}/recipes/swagger.md"

# FILENAME_="../README.md"

# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }
# ## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }
# ### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# # echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# # echo "-->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # cat ./Header.md >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# # echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # cat ./Overview.md >>${FILENAME_}
# # echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# imagetag_chevron_right
# _imgpath="./content/assets/svg"
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_section
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_sub-section
# echo ""
# echo ""
# echo ""

# snDATE=$(date +%y%m%d)
# snDATEu=$(date --utc +%y%m%d)
# snTIME=$(date +%H%M%S%Z)
# snTIMEu=$(date --utc +%H%M%S%Z)
# snEPOCH=$(date +%s)
# snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
# snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
# pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
# pASSETS="${pTMP_PATH}/src/assets"
# pCONTENT="${pTMP_PATH}/content"

# _width1=15
# _width2=20
# _width3=25

# _imgpath="./content/assets/svg/"
# _iconpath="./content/assets/svg/"

# _logosmall="/logo-small.svg"

# _icon1up="/chevrons-up.svg"
# _icon1lft="/chevrons-left.svg"
# _icon1rgh="/chevrons-right.svg"

# _icon2up="/chevron-up.svg"
# _icon2lft="/chevron-left.svg"
# _icon2rgh="/chevron-right.svg"

# sect1_="# "
# sect2_="## "
# sect3_="### "
# sect4_="#### "

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="_imgwidth"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

#!/bin/zsh

cd /home/luxcium/.local/src/nestjs-colligated-docs
source /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/cat-functions.sh

pTMP_PATH="/tmp/docs.nestjs.com-$(getSTMP8a)"
pTMP_content_="${pTMP_PATH}/content"

gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH} # && cd ${pTMP_PATH}/content/
cp -r /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/ ${pTMP_PATH}/content
cd ${pTMP_PATH}/content
mkdir build

pwd
lf

# git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}

# source "./cat-functions.sh"

# function imagetag_() {
#   echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"
# }

# _anchorpage=""
# _anchorid=""
# function imganchortag_() {
#   _anchorinner="$(imagetag_)"
#   _anchorhash="#${_anchorid}"
#   echo -n "<a href='${_anchorpage}${_anchorhash}'>${_anchorinner}</a>"
# }

# function imagetag_logo-small() {
#   _imgsrc="${_logosmall}"
#   _imgalt="Nest JS Small Logo"
#   imganchortag_
# }

# function imagetag_chevrons_up() {
#   _imgsrc="${_icon1up}"
#   _imgalt="Go top"
#   imganchortag_
# }

# function imagetag_chevrons_left() {
#   _imgsrc="${_icon1lft}"
#   _imgalt="Previous section"
#   imganchortag_
# }

# function imagetag_chevrons_right() {
#   _imgsrc="${_icon1rgh}"
#   _imgalt="Next section"
#   imganchortag_
# }

# function imagetag_chevron_up() {
#   _imgsrc="${_icon2up}"
#   _imgalt="Go top section"
#   imganchortag_
# }

# function imagetag_chevron_left() {
#   _imgsrc="${_icon2lft}"
#   _imgalt="Previous sub-section"
#   imganchortag_
# }

# function imagetag_chevron_right() {
#   _imgsrc="${_icon2rgh}"
#   _imgalt="Next sub-section"
#   imganchortag_
# }

# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }

# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }

# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }
# ## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }
### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# echo "-->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Header.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Overview.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# # imagetag_chevron_right
# _imgpath="./content/assets/svg"
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_section
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_sub-section
# echo ""
# echo ""
# echo ""

# snDATE=$(date +%y%m%d)
# snDATEu=$(date --utc +%y%m%d)
# snTIME=$(date +%H%M%S%Z)
# snTIMEu=$(date --utc +%H%M%S%Z)
# snEPOCH=$(date +%s)
# snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
# snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
# pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
# pASSETS="${pTMP_PATH}/src/assets"
# pCONTENT="${pTMP_PATH}/content"

# _width1=15
# _width2=20
# _width3=25

# _imgpath="./content/assets/svg/"
# _iconpath="./content/assets/svg/"

# _logosmall="/logo-small.svg"

# _icon1up="/chevrons-up.svg"
# _icon1lft="/chevrons-left.svg"
# _icon1rgh="/chevrons-right.svg"

# _icon2up="/chevron-up.svg"
# _icon2lft="/chevron-left.svg"
# _icon2rgh="/chevron-right.svg"

# sect1_="# "
# sect2_="## "
# sect3_="### "
# sect4_="#### "

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="_imgwidth"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# mv ${pASSETS} ${pCONTENT}
# rm -fr "${pCONTENT}/discover"
# rm -fr "${pCONTENT}/recipes/swagger.md"

# FILENAME_="../README.md"

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# # gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

# mv ${pASSETS} ${pCONTENT}
# rm -fr "${pCONTENT}/discover"
# rm -fr "${pCONTENT}/recipes/swagger.md"

# FILENAME_="../README.md"

# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }
# ## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }
# ### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# # echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# # echo "-->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # cat ./Header.md >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# # echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # cat ./Overview.md >>${FILENAME_}
# # echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# imagetag_chevron_right
# _imgpath="./content/assets/svg"
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_section
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_sub-section
# echo ""
# echo ""
# echo ""

# snDATE=$(date +%y%m%d)
# snDATEu=$(date --utc +%y%m%d)
# snTIME=$(date +%H%M%S%Z)
# snTIMEu=$(date --utc +%H%M%S%Z)
# snEPOCH=$(date +%s)
# snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
# snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
# pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
# pASSETS="${pTMP_PATH}/src/assets"
# pCONTENT="${pTMP_PATH}/content"

# _width1=15
# _width2=20
# _width3=25

# _imgpath="./content/assets/svg/"
# _iconpath="./content/assets/svg/"

# _logosmall="/logo-small.svg"

# _icon1up="/chevrons-up.svg"
# _icon1lft="/chevrons-left.svg"
# _icon1rgh="/chevrons-right.svg"

# _icon2up="/chevron-up.svg"
# _icon2lft="/chevron-left.svg"
# _icon2rgh="/chevron-right.svg"

# sect1_="# "
# sect2_="## "
# sect3_="### "
# sect4_="#### "

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="_imgwidth"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# echo "-->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Header.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Overview.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}


#+ OLD MODIFIED CODE
#+ OLD MODIFIED CODE
#+ OLD MODIFIED CODE




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
