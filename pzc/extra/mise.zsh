# -*- tab-width: 2; indent-tabs-mode: nil; coding: utf-8 -*-
# ------------------------------------------------------------------------------
# Copyright 2022-2026 Alexandre l'Heritier
# See the top-level LICENSE file for details.
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# mise.zsh
#
# Mise-en-place specific part.
# ------------------------------------------------------------------------------



mkdir -p "${ENVI_DIR}/pzc/progs/mise"



# ------------------------------------------------------------------------------
# Install
# ------------------------------------------------------------------------------

if [[ ${_PZC_MISE_AVAILABLE} = 0 ]]
then
  _pzc_debug "Define pzc_install_mise function"
  function pzc_install_mise()
  {
    local MISE_INSTALL_DIR="${ENVI_DIR}/pzc/progs/mise"

    _pzc_info "Install Mise in ${MISE_INSTALL_DIR} path."

    mkdir -p "${MISE_INSTALL_DIR}"

    wget -q -O "${TMP_DIR}/install_mise.sh" "https://github.com/jdx/mise/releases/latest/download/install.sh"

    _pzc_warning "Please check hash of 'install.sh' before continuing here : https://github.com/jdx/mise/releases/latest"
    _pzc_info "Hash (sha256) :"
    sha256sum "${TMP_DIR}/install_mise.sh"

    read -s -k $'?Press any key to continue install or Ctrl+C to stop here.\n'

    _pzc_info "You can check script with this command :"
    _pzc_coal "${PZC_FILE_EDITOR} \"${TMP_DIR}/install_mise.sh\""

    read -s -k $'?Press any key to launch script or Ctrl+C to stop here.\n'

    chmod u+x ${TMP_DIR}/install_mise.sh

    export MISE_INSTALL_PATH="${MISE_INSTALL_DIR}/mise"
    ${TMP_DIR}/install_mise.sh

    if [[ $? = 0 ]]
    then
      _pzc_info "Enabling Mise..."
      sed -i 's/local _PZC_MISE_AVAILABLE=0/local _PZC_MISE_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}

      _pzc_info "Reload ZSH..."
      exec zsh
    else
      _pzc_error "Error with wget call."
    fi
  }
fi

# ------------------------------------------------------------------------------
# Activate Mise
# ------------------------------------------------------------------------------

if [[ ${_PZC_MISE_AVAILABLE} = 1 ]]
then
  if [[ ${_PZC_MISE_START_AT_LAUNCH} = 1 ]]
  then
    # _pzc_debug "Activate mise."
    # eval "$(${PZC_MISE_BIN} activate zsh)"

  else
    _pzc_debug "Define smise function"
    function smise()
    {
      _pzc_info "Activate mise."
      eval "$(${PZC_MISE_BIN} activate zsh)"
    }
  fi
fi
