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



# ------------------------------------------------------------------------------
# ------------------------ Check editor -------------------------
# ------------------------------------------------------------------------------

if [[ ! -v PZC_FILE_EDITOR ]]
then
  _pzc_debug "PZC_FILE_EDITOR is not set. Default editor is set to vim."
  PZC_FILE_EDITOR=vim
fi



# ------------------------------------------------------------------------------
# Check compilers
# ------------------------------------------------------------------------------

if [[ ${_PZC_GCC_AVAILABLE} = 1 ]]
then

  if [[ -v PZC_C_GCC_BIN ]] && [[ -x "$(command -v ${PZC_C_GCC_BIN})" ]]
  then
    _pzc_debug "PZC_C_GCC_BIN = ${PZC_C_GCC_BIN} (user defined)"

  elif [[ -v PZC_C_GCC_BIN ]]
  then
    _pzc_warning "Your gcc is not found. Search other gcc."
    _pzc_debug "PZC_C_GCC_BIN = ${PZC_C_GCC_BIN} (unset)"
    unset PZC_C_GCC_BIN

  fi

  if [[ ! -v PZC_C_GCC_BIN ]]
  then

    if [[ -x "$(command -v gcc)" ]]
    then
      PZC_C_GCC_BIN=gcc
      _PZC_GCC_AVAILABLE=1
      _pzc_debug "PZC_C_GCC_BIN = ${PZC_C_GCC_BIN} (in PATH)"
      
    else
      _PZC_GCC_AVAILABLE=0
      _pzc_warning "GCC is not installed. You can disable gcc search in pzcrc."

    fi
  fi
else
  _pzc_debug "GCC disabled."

fi

if [[ ${_PZC_GCC_AVAILABLE} = 1 ]]
then

  if [[ -v PZC_CXX_GCC_BIN ]] && [[ -x "$(command -v ${PZC_CXX_GCC_BIN})" ]]
  then
    _pzc_debug "PZC_CXX_GCC_BIN = ${PZC_CXX_GCC_BIN} (user defined)"

  elif [[ -v PZC_CXX_GCC_BIN ]]
  then
    _pzc_warning "Your g++ is not found. Search other g++."
    _pzc_debug "PZC_CXX_GCC_BIN = ${PZC_CXX_GCC_BIN} (unset)"
    unset PZC_CXX_GCC_BIN

  fi

  if [[ ! -v PZC_CXX_GCC_BIN ]]
  then

    if [[ -x "$(command -v g++)" ]]
    then
      PZC_CXX_GCC_BIN=g++
      _PZC_GCC_AVAILABLE=1
      _pzc_debug "PZC_CXX_GCC_BIN = ${PZC_CXX_GCC_BIN} (in PATH)"
      
    else
      _PZC_GCC_AVAILABLE=0
      _pzc_warning "G++ is not installed. You can disable g++ search in pzcrc."

    fi
  fi
else
  _pzc_debug "G++ disabled."

fi

if [[ ${_PZC_CLANG_AVAILABLE} = 1 ]]
then

  if [[ -v PZC_C_CLANG_BIN ]] && [[ -x "$(command -v ${PZC_C_CLANG_BIN})" ]]
  then
    _pzc_debug "PZC_C_CLANG_BIN = ${PZC_C_CLANG_BIN} (user defined)"

  elif [[ -v PZC_C_CLANG_BIN ]]
  then
    _pzc_warning "Your clang is not found. Search other clang."
    _pzc_debug "PZC_C_CLANG_BIN = ${PZC_C_CLANG_BIN} (unset)"
    unset PZC_C_CLANG_BIN

  fi

  if [[ ! -v PZC_C_CLANG_BIN ]]
  then

    if [[ -x "$(command -v clang)" ]]
    then
      PZC_C_CLANG_BIN=clang
      _PZC_CLANG_AVAILABLE=1
      _pzc_debug "PZC_C_CLANG_BIN = ${PZC_C_CLANG_BIN} (in PATH)"
      
    else
      _PZC_CLANG_AVAILABLE=0
      _pzc_warning "CLang is not installed. You can disable clang search in pzcrc."

    fi
  fi
else
  _pzc_debug "CLang disabled."

fi

if [[ ${_PZC_CLANG_AVAILABLE} = 1 ]]
then

  if [[ -v PZC_CXX_CLANG_BIN ]] && [[ -x "$(command -v ${PZC_CXX_CLANG_BIN})" ]]
  then
    _pzc_debug "PZC_CXX_CLANG_BIN = ${PZC_CXX_CLANG_BIN} (user defined)"

  elif [[ -v PZC_CXX_CLANG_BIN ]]
  then
    _pzc_warning "Your clang++ is not found. Search other clang++."
    _pzc_debug "PZC_CXX_CLANG_BIN = ${PZC_CXX_CLANG_BIN} (unset)"
    unset PZC_CXX_CLANG_BIN

  fi

  if [[ ! -v PZC_CXX_CLANG_BIN ]]
  then

    if [[ -x "$(command -v clang++)" ]]
    then
      PZC_CXX_CLANG_BIN=clang++
      _PZC_CLANG_AVAILABLE=1
      _pzc_debug "PZC_CXX_CLANG_BIN = ${PZC_CXX_CLANG_BIN} (in PATH)"
      
    else
      _PZC_CLANG_AVAILABLE=0
      _pzc_warning "CLang++ is not installed. You can disable clang++ search in pzcrc."

    fi
  fi
else
  _pzc_debug "CLang++ disabled."

fi

if [[ ${_PZC_NVCC_BIN_AVAILABLE} = 1 ]]
then

  if [[ -v PZC_NVCC_BIN ]] && [[ -x "$(command -v ${PZC_NVCC_BIN})" ]]
  then
    _pzc_debug "PZC_NVCC_BIN = ${PZC_NVCC_BIN} (user defined)"

  elif [[ -v PZC_NVCC_BIN ]]
  then
    _pzc_warning "Your nvcc is not found. Search other nvcc."
    _pzc_debug "PZC_NVCC_BIN = ${PZC_NVCC_BIN} (unset)"
    unset PZC_NVCC_BIN

  fi

  if [[ ! -v PZC_NVCC_BIN ]]
  then

    if [[ -x "$(command -v nvcc)" ]]
    then
      PZC_NVCC_BIN=nvcc
      _PZC_NVCC_BIN_AVAILABLE=1
      _pzc_debug "PZC_NVCC_BIN = ${PZC_NVCC_BIN} (in PATH)"
      
    else
      _PZC_NVCC_BIN_AVAILABLE=0
      _pzc_warning "NVCC is not installed. You can disable nvcc search in pzcrc."

    fi
  fi

  if [[ ${_PZC_NVCC_BIN_AVAILABLE} = 1 ]]
  then

    if [[ -v PZC_NVCC_HOST_COMPILER_BIN ]] && [[ -x "$(command -v ${PZC_NVCC_HOST_COMPILER_BIN})" ]]
    then
      _pzc_debug "PZC_NVCC_HOST_COMPILER_BIN = ${PZC_NVCC_HOST_COMPILER_BIN} (user defined)"

    elif [[ -v PZC_NVCC_HOST_COMPILER_BIN ]]
    then
      _pzc_warning "Your host compiler for nvcc is not found. Search other one."
      _pzc_debug "PZC_NVCC_HOST_COMPILER_BIN = ${PZC_NVCC_HOST_COMPILER_BIN} (unset)"
      unset PZC_NVCC_HOST_COMPILER_BIN

    fi

    if [[ ! -v PZC_NVCC_HOST_COMPILER_BIN ]]
    then

      if [[ ${_PZC_GCC_AVAILABLE} = 1 ]]
      then
        PZC_NVCC_HOST_COMPILER_BIN=${PZC_CXX_GCC_BIN}
        _PZC_NVCC_BIN_AVAILABLE=1
        _pzc_debug "PZC_NVCC_HOST_COMPILER_BIN = ${PZC_NVCC_HOST_COMPILER_BIN} (G++) (in PATH)"

      elif [[ ${_PZC_CLANG_AVAILABLE} = 1 ]]
      then
        PZC_NVCC_HOST_COMPILER_BIN=${PZC_CXX_CLANG_BIN}
        _PZC_NVCC_BIN_AVAILABLE=1
        _pzc_debug "PZC_NVCC_HOST_COMPILER_BIN = ${PZC_NVCC_HOST_COMPILER_BIN} (CLang++) (in PATH)"

      else
        _PZC_NVCC_BIN_AVAILABLE=0
        _pzc_warning "Host compiler for nvcc is not found. You can disable nvcc search in pzcrc."

      fi
    fi
  fi
else
  _pzc_debug "NVCC disabled."

fi

if [[ ${_PZC_SYCL_BIN_AVAILABLE} = 1 ]]
then

  if [[ -v PZC_SYCL_BIN ]] && [[ -x "$(command -v ${PZC_SYCL_BIN})" ]]
  then
    _pzc_debug "PZC_SYCL_BIN = ${PZC_SYCL_BIN} (user defined)"

  elif [[ -v PZC_SYCL_BIN ]]
  then
    _pzc_warning "Your sycl is not found. Search other sycl."
    _pzc_debug "PZC_SYCL_BIN = ${PZC_SYCL_BIN} (unset)"
    unset PZC_SYCL_BIN

  fi

  if [[ ! -v PZC_SYCL_BIN ]]
  then

    if [[ -x "$(command -v sycl)" ]]
    then
      PZC_SYCL_BIN=sycl
      _PZC_SYCL_BIN_AVAILABLE=1
      _pzc_debug "PZC_SYCL_BIN = ${PZC_SYCL_BIN} (in PATH)"
      
    else
      _PZC_SYCL_BIN_AVAILABLE=0
      _pzc_warning "Sycl is not installed. You can disable sycl search in pzcrc."

    fi
  fi

  if [[ ${_PZC_SYCL_BIN_AVAILABLE} = 1 ]]
  then

    if [[ -v PZC_SYCL_HOST_COMPILER_BIN ]] && [[ -x "$(command -v ${PZC_SYCL_HOST_COMPILER_BIN})" ]]
    then
      _pzc_debug "PZC_SYCL_HOST_COMPILER_BIN = ${PZC_SYCL_HOST_COMPILER_BIN} (user defined)"

    elif [[ -v PZC_SYCL_HOST_COMPILER_BIN ]]
    then
      _pzc_warning "Your host compiler for sycl is not found. Search other one."
      _pzc_debug "PZC_SYCL_HOST_COMPILER_BIN = ${PZC_SYCL_HOST_COMPILER_BIN} (unset)"
      unset PZC_SYCL_HOST_COMPILER_BIN

    fi

    if [[ ! -v PZC_SYCL_HOST_COMPILER_BIN ]]
    then

      if [[ ${_PZC_CLANG_AVAILABLE} = 1 ]]
      then
        PZC_SYCL_HOST_COMPILER_BIN=${PZC_CXX_CLANG_BIN}
        _PZC_SYCL_BIN_AVAILABLE=1
        _pzc_debug "PZC_SYCL_HOST_COMPILER_BIN = ${PZC_SYCL_HOST_COMPILER_BIN} (CLang++) (in PATH)"

      elif [[ ${_PZC_GCC_AVAILABLE} = 1 ]]
      then
        PZC_SYCL_HOST_COMPILER_BIN=${PZC_CXX_GCC_BIN}
        _PZC_SYCL_BIN_AVAILABLE=1
        _pzc_debug "PZC_SYCL_HOST_COMPILER_BIN = ${PZC_SYCL_HOST_COMPILER_BIN} (G++) (in PATH)"

      else
        _PZC_SYCL_BIN_AVAILABLE=0
        _pzc_warning "Host compiler for sycl is not found. You can disable sycl search in pzcrc."

      fi
    fi
  fi

else
  _pzc_debug "SYCL disabled."

fi

if [[ ${_PZC_GCC_AVAILABLE} = 1 ]] || [[ ${_PZC_CLANG_AVAILABLE} = 1 ]]
then
  PZC_C_CXX_AVAILABLE=1

else
  PZC_C_CXX_AVAILABLE=0
fi

if [[ ${_PZC_NVCC_BIN_AVAILABLE} = 1 ]] || [[ ${_PZC_SYCL_BIN_AVAILABLE} = 1 ]]
then
  PZC_GPU_AVAILABLE=1

else
  PZC_GPU_AVAILABLE=0
fi

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

source ${PZC_PZC_DIR}/pzc/core/external_v2.zsh

if [[ ! -e ${PZC_PZC_PKG_LOCATION_FILE} ]]
then
  _pzc_error "pkg_location not found"
else
  source ${PZC_PZC_PKG_LOCATION_FILE}
fi



# ------------------------------------------------------------------------------
# OhMyPosh
# ------------------------------------------------------------------------------

if [[ "${_PZC_OMP_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${_PZC_OMP_BIN})" ]]
  then
    _pzc_debug "Oh-My-Posh enable"
    _PZC_OMP_AVAILABLE=1
  else
    _pzc_error "Oh-My-Posh not found, call TODO"
  fi
else
  _pzc_debug "Oh-My-Posh disabled"
  _PZC_OMP_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# EZA-LS
# ------------------------------------------------------------------------------

if [[ "${PZC_EZA_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_EZA_BIN})" ]]
  then
    _pzc_debug "EZA enable"
    _PZC_EZA_AVAILABLE=1
  else
    _pzc_error "EZA not found, call TODO"
  fi
else
  _pzc_debug "EZA disabled"
  _PZC_EZA_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# CCache
# ------------------------------------------------------------------------------

if [[ "${PZC_CCACHE_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_CCACHE_BIN})" ]]
  then
    _pzc_debug "CCache enable"
    _PZC_CCACHE_AVAILABLE=1
  else
    _pzc_error "CCache not found, call TODO"
  fi
else
  _pzc_debug "CCache disabled"
  _PZC_CCACHE_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# Mold
# ------------------------------------------------------------------------------

if [[ "${PZC_MOLD_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_MOLD_BIN})" ]]
  then
    _pzc_debug "Mold enable"
    _PZC_MOLD_AVAILABLE=1
    local PZC_MOLD_PATH=$(dirname "${PZC_MOLD_BIN}")
    if [[ "${PZC_MOLD_PATH}" != "." ]]
    then
      export PATH=${PZC_MOLD_PATH}:${PATH}
      _pzc_debug "Edit PATH to add Mold"
    fi
  else
    _pzc_error "Mold not found, call TODO"
  fi
else
  _pzc_debug "Mold disabled"
  _PZC_MOLD_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# Ninja
# ------------------------------------------------------------------------------

if [[ "${PZC_NINJA_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_NINJA_BIN})" ]]
  then
    _pzc_debug "Ninja enable"
    _PZC_NINJA_AVAILABLE=1
    local PZC_NINJA_PATH=$(dirname "${PZC_NINJA_BIN}")
    if [[ "${PZC_NINJA_PATH}" != "." ]]
    then
      export PATH=${PZC_NINJA_PATH}:${PATH}
      _pzc_debug "Edit PATH to add Ninja"
    fi
  else
    _pzc_error "Ninja not found, call TODO"
  fi
else
  _pzc_debug "Ninja disabled"
  _PZC_NINJA_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# CMake
# ------------------------------------------------------------------------------

if [[ "${PZC_CMAKE_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_CMAKE_BIN})" ]]
  then
    _pzc_debug "CMake enable"
    _PZC_CMAKE_AVAILABLE=1
    local PZC_CMAKE_PATH=$(dirname "${PZC_CMAKE_BIN}")
    if [[ "${PZC_CMAKE_PATH}" != "." ]]
    then
      export PATH=${PZC_CMAKE_PATH}:${PATH}
      _pzc_debug "Edit PATH to add CMake"
    fi
  else
    _pzc_error "CMake not found, call TODO"
  fi
else
  _pzc_debug "CMake disabled"
  _PZC_CMAKE_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# TASKWARRIOR
# ------------------------------------------------------------------------------

if [[ "${PZC_TASK_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_TASK_BIN})" ]]
  then
    _pzc_debug "Taskwarrior enable"
    _PZC_TASK_AVAILABLE=1
    local PZC_TASK_PATH=$(dirname "${PZC_TASK_BIN}")
    if [[ "${PZC_TASK_PATH}" != "." ]]
    then
      export PATH=${PZC_TASK_PATH}:${PATH}
      _pzc_debug "Edit PATH to add Taskwarrior"
    fi
  else
    _pzc_error "Taskwarrior not found, call TODO"
  fi
else
  _pzc_debug "Taskwarrior disabled"
  _PZC_TASK_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# Atuin
# ------------------------------------------------------------------------------

if [[ "${PZC_ATUIN_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_ATUIN_BIN})" ]]
  then
    _pzc_debug "Atuin enable"
    _PZC_ATUIN_AVAILABLE=1
  else
    _pzc_error "Atuin not found, call TODO"
  fi
else
  _pzc_debug "Atuin disabled"
  _PZC_ATUIN_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# Fzf
# ------------------------------------------------------------------------------

if [[ "${PZC_FZF_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_FZF_BIN})" ]]
  then
    _pzc_debug "Fzf enable"
    _PZC_FZF_AVAILABLE=1
  else
    _pzc_error "Fzf not found, call TODO"
  fi
else
  _pzc_debug "Fzf disabled"
  _PZC_FZF_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# Yazi
# ------------------------------------------------------------------------------

if [[ "${PZC_YAZI_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_YAZI_BIN})" ]]
  then
    _pzc_debug "Yazi enable"
    _PZC_YAZI_AVAILABLE=1
  else
    _pzc_error "Yazi not found, call TODO"
  fi
else
  _pzc_debug "Yazi disabled"
  _PZC_YAZI_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# Python
# ------------------------------------------------------------------------------

if [[ "${PZC_PYTHON_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_PYTHON_BIN})" ]]
  then
    _pzc_debug "Python enable"
    _PZC_PYTHON_AVAILABLE=1
    local PZC_PYTHON_PATH=$(dirname "${PZC_PYTHON_BIN}")
    if [[ "${PZC_PYTHON_PATH}" != "." ]]
    then
      export PATH=${PZC_PYTHON_PATH}:${PATH}
      _pzc_debug "Edit PATH to add Python"
    fi
  else
    _pzc_error "Python not found, call TODO"
  fi
else
  _pzc_debug "Python disabled"
  _PZC_PYTHON_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# Mise-en-place
# ------------------------------------------------------------------------------

if [[ "${PZC_MISE_BIN}" != "" ]]
then
  if [[ -x "$(command -v ${PZC_MISE_BIN})" ]]
  then
    _pzc_debug "Mise enable"
    _PZC_MISE_AVAILABLE=1
  else
    _pzc_error "Mise not found, call TODO"
  fi
else
  _pzc_debug "Mise disabled"
  _PZC_MISE_AVAILABLE=0
fi



# ------------------------------------------------------------------------------
# PZC Install Part
# ------------------------------------------------------------------------------

if [[ ${_PZC_MISE_AVAILABLE} = 1 ]]
then

  # ------------------------
  # ------ Oh-My-Posh ------
  # ------------------------

  if [[ ${_PZC_OMP_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_omp function"
    pzc_install_omp()
    {
      _pzc_info "Installing Oh-My-Posh with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install oh-my-posh"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling Oh-My-Posh..."
        _pzc_coal_eval "sed -i 's/local _PZC_OMP_AVAILABLE=0/local _PZC_OMP_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" oh-my-posh"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  else
    pzc_install_omp()
    {
      _pzc_info "Oh-My-Posh is already installed."
    }
  fi


  # ------------------------
  # --------- EZA ----------
  # ------------------------

  if [[ ${_PZC_EZA_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_eza function"
    pzc_install_eza()
    {
      _pzc_info "Installing EZA with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install eza"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling EZA..."
        _pzc_coal_eval "sed -i 's/local _PZC_EZA_AVAILABLE=0/local _PZC_EZA_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" eza"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  else
    pzc_install_eza()
    {
      _pzc_info "EZA is already installed."
    }
  fi


  # ------------------------
  # -------- CCache --------
  # ------------------------

  if [[ ${_PZC_CCACHE_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_ccache function"
    pzc_install_ccache()
    {
      _pzc_info "Installing CCache with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install ccache"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling CCache..."
        _pzc_coal_eval "sed -i 's/local _PZC_CCACHE_AVAILABLE=0/local _PZC_CCACHE_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" ccache"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  else
    pzc_install_ccache()
    {
      _pzc_info "CCache is already installed."
    }
  fi


  # ------------------------
  # --------- Mold ---------
  # ------------------------

  if [[ ${_PZC_MOLD_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_mold function"
    pzc_install_mold()
    {
      _pzc_info "Installing Mold with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install mold"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling Mold..."
        _pzc_coal_eval "sed -i 's/local _PZC_MOLD_AVAILABLE=0/local _PZC_MOLD_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" mold"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  else
    pzc_install_mold()
    {
      _pzc_info "Mold is already installed."
    }
  fi


  # ------------------------
  # --------- Ninja --------
  # ------------------------

  if [[ ${_PZC_NINJA_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_ninja function"
    pzc_install_ninja()
    {
      _pzc_info "Installing Ninja with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install ninja"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling Ninja..."
        _pzc_coal_eval "sed -i 's/local _PZC_NINJA_AVAILABLE=0/local _PZC_NINJA_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" ninja"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  else
    pzc_install_ninja()
    {
      _pzc_info "Ninja is already installed."
    }
  fi


  # ------------------------
  # --------- CMake --------
  # ------------------------

  if [[ ${_PZC_CMAKE_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_cmake function"
    pzc_install_cmake()
    {
      _pzc_info "Installing CMake with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install cmake"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling CMake..."
        _pzc_coal_eval "sed -i 's/local _PZC_CMAKE_AVAILABLE=0/local _PZC_CMAKE_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" cmake"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  else
    pzc_install_cmake()
    {
      _pzc_info "CMake is already installed."
    }
  fi


  # ------------------------
  # --------- Atuin --------
  # ------------------------

  if [[ ${_PZC_ATUIN_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_atuin function"
    pzc_install_atuin()
    {
      _pzc_info "Installing Atuin with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install atuin"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling Atuin..."
        _pzc_coal_eval "sed -i 's/local _PZC_ATUIN_AVAILABLE=0/local _PZC_ATUIN_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" atuin"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  else
    pzc_install_atuin()
    {
      _pzc_info "Atuin is already installed."
    }
  fi


  # ------------------------
  # --------- Fzf ----------
  # ------------------------

  if [[ ${_PZC_FZF_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_fzf function"
    pzc_install_fzf()
    {
      _pzc_info "Installing Fzf with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install fzf"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling Fzf..."
        _pzc_coal_eval "sed -i 's/local _PZC_FZF_AVAILABLE=0/local _PZC_FZF_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" fzf"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  fi


  # ------------------------
  # --------- Yazi ---------
  # ------------------------

  if [[ ${_PZC_YAZI_AVAILABLE} = 0 ]]
  then
    _pzc_debug "Define pzc_install_yazi function"
    pzc_install_yazi()
    {
      _pzc_info "Installing Yazi with Mise-en-place..."

      _pzc_coal_eval "${PZC_MISE_BIN} install yazi"

      if [[ $? = 0 ]]
      then
        _pzc_info "Enabling Yazi..."
        _pzc_coal_eval "sed -i 's/local _PZC_YAZI_AVAILABLE=0/local _PZC_YAZI_AVAILABLE=1/g' ${PZC_PZC_CONFIG_FILE}"

        _pzc_info "Update PZC's mise.toml..."
        _pzc_coal_eval "${PZC_MISE_BIN} use -p \"${ENVI_DIR}/pzc/progs/mise/mise.${HOST}.toml\" yazi"

        if [[ ! -n ${_PZC_PKG_RESTART} ]] || [[ ${_PZC_PKG_RESTART} = 1 ]]
        then
          _pzc_info "Reloading ZSH..."
          exec zsh
        fi
      else
        _pzc_error "Error with Mise-en-place."
      fi
    }
  fi


  pzc_install_all()
  {
    local _PZC_PKG_RESTART=0

    pzc_install_omp
    pzc_install_eza
    pzc_install_ccache
    pzc_install_mold
    pzc_install_ninja
    pzc_install_cmake
    pzc_install_atuin
    pzc_install_fzf
    pzc_install_yazi

    _pzc_info "Reloading ZSH..."
    exec zsh
  }

fi
