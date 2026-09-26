# -*- tab-width: 2; indent-tabs-mode: nil; coding: utf-8 -*-
# ------------------------------------------------------------------------------
# Copyright 2022-2026 Alexandre l'Heritier
# See the top-level LICENSE file for details.
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# external.zsh
#
# Check availability of external progs.
# ------------------------------------------------------------------------------



function _pzc_generate_config_general()
{
  # ---------------------------------------
  # file_editor
  # ---------------------------------------

  local PZC_FILE_EDITOR=$(jq -r '.pzc_config_general.file_editor' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ "${PZC_FILE_EDITOR}" == "" ]] || [[ "${PZC_FILE_EDITOR}" == "null" ]]
  then
    PZC_FILE_EDITOR='vim'
  fi
  echo "PZC_FILE_EDITOR=\"${PZC_FILE_EDITOR}\"" >> ${PZC_PZC_CONFIG_FILE}



  # ---------------------------------------
  # disable_welcome
  # ---------------------------------------

  local PZC_DISABLE_WELCOME=$(jq -r '.pzc_config_general.disable_welcome' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ ${PZC_DISABLE_WELCOME} = true ]]
  then
    echo "local _PZC_DISABLE_WELCOME=1" >> ${PZC_PZC_CONFIG_FILE}
  fi



  # ---------------------------------------
  # log_info
  # ---------------------------------------

  local PZC_LOG_INFO=$(jq -r '.pzc_config_general.log_info' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ ${PZC_LOG_INFO} = false ]]
  then
    echo "PZC_LOG_INFO=0" >> ${PZC_PZC_CONFIG_FILE}
  else
    echo "PZC_LOG_INFO=1" >> ${PZC_PZC_CONFIG_FILE}
  fi



  # ---------------------------------------
  # log_warning
  # ---------------------------------------

  local PZC_LOG_WARNING=$(jq -r '.pzc_config_general.log_warning' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ ${PZC_LOG_WARNING} = false ]]
  then
    echo "PZC_LOG_WARNING=0" >> ${PZC_PZC_CONFIG_FILE}
  else
    echo "PZC_LOG_WARNING=1" >> ${PZC_PZC_CONFIG_FILE}
  fi



  # ---------------------------------------
  # log_error
  # ---------------------------------------

  local PZC_LOG_ERROR=$(jq -r '.pzc_config_general.log_error' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ ${PZC_LOG_ERROR} = false ]]
  then
    echo "PZC_LOG_ERROR=0" >> ${PZC_PZC_CONFIG_FILE}
  else
    echo "PZC_LOG_ERROR=1" >> ${PZC_PZC_CONFIG_FILE}
  fi



  # ---------------------------------------
  # log_debug
  # ---------------------------------------

  local PZC_LOG_DEBUG=$(jq -r '.pzc_config_general.log_debug' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ ${PZC_LOG_DEBUG} = true ]]
  then
    echo "PZC_LOG_DEBUG=1" >> ${PZC_PZC_CONFIG_FILE}
  else
    echo "PZC_LOG_DEBUG=0" >> ${PZC_PZC_CONFIG_FILE}
  fi



  # ---------------------------------------
  # large_dir
  # ---------------------------------------

  local PZC_LARGE_DIR=$(jq -r '.pzc_config_dirs.large_dir' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ "${PZC_LARGE_DIR}" == "" ]] || [[ "${PZC_LARGE_DIR}" == "null" ]]
  then
    PZC_LARGE_DIR='${HOME}'
  fi
  echo "local LARGE_DIR=\"${PZC_LARGE_DIR}\"" >> ${PZC_PZC_CONFIG_FILE}



  # ---------------------------------------
  # tmp_dir
  # ---------------------------------------

  local PZC_TMP_DIR=$(jq -r '.pzc_config_dirs.tmp_dir' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ "${PZC_TMP_DIR}" == "" ]] || [[ "${PZC_TMP_DIR}" == "null" ]]
  then
    if [[ -v TMPDIR ]]
    then
      PZC_TMP_DIR="${TMPDIR}/pzc"
    else
      PZC_TMP_DIR="/tmp/pzc"
    fi
  fi
  echo "export TMP_DIR=\"${PZC_TMP_DIR}\"" >> ${PZC_PZC_CONFIG_FILE}



  # ---------------------------------------
  # work_dir
  # ---------------------------------------

  local PZC_WORK_DIR=$(jq -r '.pzc_config_dirs.work_dir' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ "${PZC_WORK_DIR}" == "" ]] || [[ "${PZC_WORK_DIR}" == "null" ]]
  then
    PZC_WORK_DIR='${LARGE_DIR}/work'
  fi
  echo "export WORK_DIR=\"${PZC_WORK_DIR}\"" >> ${PZC_PZC_CONFIG_FILE}



  # ---------------------------------------
  # build_dir
  # ---------------------------------------

  local PZC_BUILD_DIR=$(jq -r '.pzc_config_dirs.build_dir' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ "${PZC_BUILD_DIR}" == "" ]] || [[ "${PZC_BUILD_DIR}" == "null" ]]
  then
    PZC_BUILD_DIR='${LARGE_DIR}/build'
  fi
  echo "export BUILD_DIR=\"${PZC_BUILD_DIR}\"" >> ${PZC_PZC_CONFIG_FILE}



  # ---------------------------------------
  # install_dir
  # ---------------------------------------

  local PZC_INSTALL_DIR=$(jq -r '.pzc_config_dirs.install_dir' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ "${PZC_INSTALL_DIR}" == "" ]] || [[ "${PZC_INSTALL_DIR}" == "null" ]]
  then
    PZC_INSTALL_DIR='${LARGE_DIR}/install'
  fi
  echo "export INSTALL_DIR=\"${PZC_INSTALL_DIR}\"" >> ${PZC_PZC_CONFIG_FILE}



  # ---------------------------------------
  # envi_dir
  # ---------------------------------------

  local PZC_ENVI_DIR=$(jq -r '.pzc_config_dirs.envi_dir' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ "${PZC_ENVI_DIR}" == "" ]] || [[ "${PZC_ENVI_DIR}" == "null" ]]
  then
    PZC_ENVI_DIR='${LARGE_DIR}/environment'
  fi
  echo "export ENVI_DIR=\"${PZC_ENVI_DIR}\"" >> ${PZC_PZC_CONFIG_FILE}



  # ---------------------------------------
  # ccache_dir
  # ---------------------------------------

  local PZC_CCACHE_DIR=$(jq -r '.pzc_config_dirs.ccache_dir' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ "${PZC_CCACHE_DIR}" == "" ]] || [[ "${PZC_CCACHE_DIR}" == "null" ]]
  then
    PZC_CCACHE_DIR='${BUILD_DIR}/ccache'
  fi
  echo "export CCACHE_DIR=\"${PZC_CCACHE_DIR}\"" >> ${PZC_PZC_CONFIG_FILE}
}
