# -*- tab-width: 2; indent-tabs-mode: nil; coding: utf-8 -*-
# ------------------------------------------------------------------------------
# Copyright 2022-2026 Alexandre l'Heritier
# See the top-level LICENSE file for details.
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# pzc_update.zsh
#
# Core functions to update PZC configuration file.
# ------------------------------------------------------------------------------




_pzc_check_update()
{
  # Maj avant v8.
  if [[ ! -e "${PZC_PZC_CONFIG_FILE_V8}" ]]
  then
    if [[ -e "${PZC_PZC_CONFIG_DIR}/pzcrc" ]]
    then
      local PZC_PZC_OLD_CONFIG_FILE="${PZC_PZC_CONFIG_DIR}/pzcrc"
    elif [[ -e "${HOME}/.pzcrc" ]]
    then
      local PZC_PZC_OLD_CONFIG_FILE="${HOME}/.pzcrc"
    else
      return 0
    fi

    source ${PZC_PZC_DIR}/pzc/core/update/before_v8.zsh
    _pzc_check_update_before_v8
    if [[ ${_PZC_FATAL_ERROR} = 1 ]]
    then
      _pzc_error "Error update"
      _PZC_FATAL_ERROR=1
      return 0
    fi
    unfunction _pzc_check_update_before_v8

    echo ""
    _pzc_info "If you change the JSON config file, to update internal config you should call 'pzc_regenerate_config' function."
    _pzc_info "First time, we call this function for you."

    echo ""
    _pzc_coal "pzc_regenerate_config"
    
    read -s -k $'?Press any key to continue.\n'
    echo ""
    
    _pzc_regenerate_config

    echo ""
    _pzc_info "Update done. Restarting zsh to continue..."
    read -s -k $'?Press any key to continue.\n'
    exec zsh
    # Ne devrait pas aller ici.
    _PZC_FATAL_ERROR=1

  # Maj après v8.
  else
    source ${PZC_PZC_DIR}/pzc/core/update/after_v8.zsh
    _pzc_check_update_json
    if [[ ${_PZC_FATAL_ERROR} = 1 ]]
    then
      _pzc_error "Error update"
      _PZC_FATAL_ERROR=1
      return 0
    fi
    unfunction _pzc_check_update_json
  fi
}
