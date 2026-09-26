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



function _pzc_generate_config_pkgs_mng()
{
  # ---------------------------------------
  # Mise-en-place
  # ---------------------------------------

  local PZC_ENABLE_MISE=$(jq -r '.pzc_config_pkgs.pkgs.mise_en_place.enable' ${PZC_PZC_CONFIG_FILE_V8})
  local PZC_ALIAS_MISE=0
  if [[ ${PZC_ENABLE_MISE} = true ]]
  then
    # Attention : Ici, PZC_MISE_BIN et _PZC_MISE_AVAILABLE sortent de la fonction. Mise peut être nécessaire pour trouver les autres packages ! 
    PZC_MISE_BIN=$(jq -r '.pzc_config_pkgs.pkgs.mise_en_place.executable_path' ${PZC_PZC_CONFIG_FILE_V8})
    if [[ "${PZC_MISE_BIN}" == "null" ]]
    then
      PZC_MISE_BIN=""
    fi
    if [[ "${PZC_MISE_BIN}" != "" ]]
    then
      if [[ -e ${PZC_MISE_BIN} ]] || [[ -x "$(command -v ${PZC_MISE_BIN})" ]]
      then
        _pzc_debug "PZC_MISE_BIN = ${PZC_MISE_BIN} (user defined)"
        PZC_ALIAS_MISE=1
        _PZC_MISE_AVAILABLE=1
      else
        _pzc_warning "Your Mise-en-place is not found. Search other Mise-en-place."
        PZC_MISE_BIN=""
      fi
    fi
    if [[ "${PZC_MISE_BIN}" == "" ]]
    then
      if [[ -x "$(command -v mise)" ]]
      then
        PZC_MISE_BIN=mise
        _pzc_debug "PZC_MISE_BIN = ${PZC_MISE_BIN} (Path)"
        _PZC_MISE_AVAILABLE=1
      elif [[ -e ${ENVI_DIR}/pzc/progs/mise/mise ]]
      then
        PZC_MISE_BIN=${ENVI_DIR}/pzc/progs/mise/mise
        _pzc_debug "PZC_MISE_BIN = ${PZC_MISE_BIN} (in pzc)"
        _PZC_MISE_AVAILABLE=1
        PZC_ALIAS_MISE=1
      fi
    fi
    if [[ "${PZC_MISE_BIN}" == "" ]]
    then
      _pzc_warning "Mise-en-place is not installed (https://github.com/jdx/mise). You can install mise-en-place in the PZC environment folder with the command 'pzc_install_mise' or disable mise search in pzcrc."
    fi
  fi

  echo "PZC_MISE_BIN=\"${PZC_MISE_BIN}\"" >> ${PZC_PZC_CONFIG_FILE}
  if [[ ${PZC_ALIAS_MISE} = 1 ]]
  then
    echo "alias mise='${PZC_MISE_BIN}'" >> ${PZC_PZC_CONFIG_FILE}
  fi



  # ---------------------------------------
  # Spack
  # ---------------------------------------

  local PZC_ENABLE_SPACK=$(jq -r '.pzc_config_pkgs.pkgs.spack.enable' ${PZC_PZC_CONFIG_FILE_V8})
  if [[ ${PZC_ENABLE_SPACK} = true ]]
  then
    # Attention : Ici, PZC_SPACK_PATH et _PZC_SPACK_AVAILABLE sortent de la fonction. Spack peut être nécessaire pour trouver les autres packages ! 
    PZC_SPACK_PATH=$(jq -r '.pzc_config_pkgs.pkgs.spack.src_path' ${PZC_PZC_CONFIG_FILE_V8})
    if [[ "${PZC_SPACK_PATH}" == "null" ]]
    then
      PZC_SPACK_PATH=""
    fi
    if [[ "${PZC_SPACK_PATH}" != "" ]]
    then
      if [[ -e ${PZC_SPACK_PATH}/share/spack/setup-env.sh ]]
      then
        _pzc_debug "PZC_SPACK_PATH = ${PZC_SPACK_PATH} (user defined)"
        _PZC_SPACK_AVAILABLE=1
      else
        _pzc_warning "Your Spack is not valid (\"${PZC_SPACK_PATH}/share/spack/setup-env.sh\" not found)."
        PZC_SPACK_PATH=""
      fi
    else
      PZC_SPACK_PATH="${ENVI_DIR}/spack"
      if [[ -e ${PZC_SPACK_PATH}/share/spack/setup-env.sh ]]
      then
        _pzc_debug "PZC_SPACK_PATH = ${PZC_SPACK_PATH}"
        _PZC_SPACK_AVAILABLE=1
      else
        _pzc_warning "The Spack install is not valid (\"${PZC_SPACK_PATH}/share/spack/setup-env.sh\" not found). You can delete it and reclone Spack."
        PZC_SPACK_PATH=""
      fi
    fi
    if [[ "${PZC_SPACK_PATH}" == "" ]]
    then
      _pzc_info "To initialise Spack, you can call pzc_install_spack function."
    fi
  fi

  echo "PZC_SPACK_PATH=\"${PZC_SPACK_PATH}\"" >> ${PZC_PZC_CONFIG_FILE}

}
