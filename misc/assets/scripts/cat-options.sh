#!/bin/sh

_base_working_path="/home/luxcium/.local/src/nestjs-colligated-docs"
_scripts_dir="${_base_working_path}/misc/assets/scripts"

source "${_scripts_dir}/stamp-functions.sh"

_pTMP_PATH="/tmp/docs.nestjs.com-${_snDATEu}-${_snTIMEshortu}-${_snSTMP4a}"
_pTMP_PATH_flags="${_pTMP_PATH}/flags-${_snSTMP4a}"

_pASSETS="${_pTMP_PATH}/src/assets"
_pCONTENT="${_pTMP_PATH}/content"

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

source "${_scripts_dir}/icons-functions.sh"
source "${_scripts_dir}/flags-functions.sh"
source "${_scripts_dir}/cat-functions.sh"
