# -*- tab-width: 2; indent-tabs-mode: nil; coding: utf-8 -*-
# ------------------------------------------------------------------------------
# Copyright 2022-2026 Alexandre l'Heritier
# See the top-level LICENSE file for details.
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# after_v8.zsh
#
# Update functions to update the json config file.
# ------------------------------------------------------------------------------



_pzc_update_json_8XX()
{
  echo ${_PZC_JSON}
}

_pzc_launch_pzc_update_json()
{
  local _PZC_JSON=$(<${PZC_PZC_CONFIG_FILE_V8})

  mv ${PZC_PZC_CONFIG_FILE_V8} ${PZC_PZC_CONFIG_FILE_V8}.old
  _pzc_info "A copy of your old json is available here: ${PZC_PZC_CONFIG_FILE_V8}.old"

  local _PZC_OUTPUT_FILE="${PZC_PZC_CONFIG_FILE_V8}"
  local _PZC_OUTPUT_FILE_TMP="${PZC_PZC_CONFIG_FILE_V8}.tmp"

  if [[ ${_PZC_CONFIG_VERSION[1]} -eq 8 ]] && [[ ${_PZC_CONFIG_VERSION[2]} -eq 0 ]] && [[ ${_PZC_CONFIG_VERSION[3]} -eq 0 ]]
  then
    _pzc_info "Updating from v8.0.0 json file to v8.x.x json file..."
    _pzc_pensil_begin
    echo "Changelog pzcrc configuration file (v8.0.0 -> v8.x.x)"
    echo "----"
    echo "Add."
    _pzc_pensil_end

    _pzc_update_json_8XX
    _PZC_CONFIG_VERSION=(8 9 0)
  fi

  _pzc_info "Update of json file done. Regenerating internal config..."
  _pzc_regenerate_config
}


_pzc_check_update_json()
{
  local _PZC_CONFIG_VERSION=("${(@f)$(jq -r '.pzc_config_general.version[]' ${PZC_PZC_CONFIG_FILE_V8})}")

  source ${PZC_PZC_DIR}/pzc/version.zsh
  source ${PZC_PZC_DIR}/pzc/core/update/version_checker.zsh

  local _PZC_VERSION_CHECKER_RET=0
  _pzc_version_checker ${_PZC_CONFIG_VERSION} ${_PZC_CONFIG_LAST_VERSION}


  if [[ ${_PZC_VERSION_CHECKER_RET} = 2 ]]
  then
    PZC_LOG_ERROR=1
    _pzc_error "PZC v${PZC_VERSION[1]}.${PZC_VERSION[2]}.${PZC_VERSION[3]} is too old to read your json config file. "
    echo "\033[0;101m\033[30m           Please update PZC ('cd \${PZC_PZC_DIR}' and 'git pull'). "
    echo "\033[0;101m\033[30m           Your json config file version:                v${_PZC_CONFIG_VERSION[1]}.${_PZC_CONFIG_VERSION[2]}.${_PZC_CONFIG_VERSION[3]}    "
    echo "\033[0;101m\033[30m           Latest version supported by your PZC version: v${_PZC_CONFIG_LAST_VERSION[1]}.${_PZC_CONFIG_LAST_VERSION[2]}.${_PZC_CONFIG_LAST_VERSION[3]}    \033[0m"
    _PZC_FATAL_ERROR=1
    return 0

  elif [[ ${_PZC_VERSION_CHECKER_RET} = 1 ]]
  then
    PZC_LOG_INFO=1
    PZC_LOG_WARNING=1
    PZC_LOG_ERROR=1

    _pzc_launch_pzc_update_json

  else
    _pzc_debug "json config file Checker OK"
  fi
}