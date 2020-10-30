#!/bin/sh


sect1_="# "
sect2_="## "
sect3_="### "
sect4_="#### "

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

function imagetag_logo-small() {
  _imgsrc="${_logosmall}"
  _imgalt="Nest JS Small Logo"
  imganchortag_
}
function imagetag_chevrons_up() {
  _imgsrc="${_icon1up}"
  _imgalt="Go top"
  imganchortag_
}
function imagetag_chevrons_left() {
  _imgsrc="${_icon1lft}"
  _imgalt="Previous section"
  imganchortag_
}
function imagetag_chevrons_right() {
  _imgsrc="${_icon1rgh}"
  _imgalt="Next section"
  imganchortag_
}
function imagetag_chevron_up() {
  _imgsrc="${_icon2up}"
  _imgalt="Go top section"
  imganchortag_
}
function imagetag_chevron_left() {
  _imgsrc="${_icon2lft}"
  _imgalt="Previous sub-section"
  imganchortag_
}
function imagetag_chevron_right() {
  _imgsrc="${_icon2rgh}"
  _imgalt="Next sub-section"
  imganchortag_
}

function _create_section() {
  echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
}

function _create_sub-section() {
  echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

}

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

mv ${pASSETS} ${pCONTENT}
rm -fr "${pCONTENT}/discover"
rm -fr "${pCONTENT}/recipes/swagger.md"

FILENAME_="../README.md"

_imgsrc="_imgsrc"
_imgwidth="20"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
function _create_section() {
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
function _create_sub-section() {
  echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

}
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
