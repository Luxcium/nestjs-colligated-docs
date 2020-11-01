#!/bin/sh

_base_work_path="/home/luxcium/.local/src/nestjs-colligated-docs"
_scripts_dir="${_base_work_path}/scripts"
_functions_dir="${_scripts_dir}/functions"
# /home/luxcium/.local/src/nestjs-colligated-docs/scripts/functions
source "${_functions_dir}/stamp-functions.sh"

_tmp_work_path="/tmp/docs.nestjs.com-${_snDATEu}-${_snTIMEshortu}-$(getSTMP4_)"
_tmp_flags_path="${_tmp_work_path}/flags-$(getSTMP4_)"
_tmp_out_path="${_tmp_work_path}/out-$(getSTMP4_)"
_tmp_assets_path="${_tmp_work_path}/src/assets"
_tmp_content_path="${_tmp_work_path}/content"

_pTMP_PATH="${_tmp_work_path}"
_pTMP_PATH_flags="${_tmp_flags_path}"
_pASSETS="${_tmp_assets_path}/src/assets"
_pCONTENT="${_tmp_content_path}/content"

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

source "${_functions_dir}/icons-functions.sh"
source "${_functions_dir}/flags-functions.sh"
source "${_functions_dir}/cat-functions.sh"
