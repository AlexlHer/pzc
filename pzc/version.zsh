# -*- tab-width: 2; indent-tabs-mode: nil; coding: utf-8 -*-
# ------------------------------------------------------------------------------
# Copyright 2022-2026 Alexandre l'Heritier
# See the top-level LICENSE file for details.
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# version.zsh
#
# PZC Version.
# ------------------------------------------------------------------------------



export PZC_VERSION=(8 0 0)
local _PZC_IS_DEV_VERSION=1
local _PZC_CONFIG_LAST_VERSION=(7 9 0)

if [[ ${_PZC_IS_DEV_VERSION} = 1 ]]
then
  _pzc_warning "You using a development version of PZC, save your config files before continuing."
  read -q "REPLY? Launching minimal version to backup config? (y/n)"
  echo ""
  if [[ ${REPLY} != "n" ]]
  then
    unset REPLY
    _PZC_FATAL_ERROR=1
  fi
  unset REPLY
fi
