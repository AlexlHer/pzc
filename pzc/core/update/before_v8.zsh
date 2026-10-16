# -*- tab-width: 2; indent-tabs-mode: nil; coding: utf-8 -*-
# ------------------------------------------------------------------------------
# Copyright 2022-2026 Alexandre l'Heritier
# See the top-level LICENSE file for details.
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# before_v8.zsh
#
# Update functions to update the old pzcrc config file.
# ------------------------------------------------------------------------------



_pzc_update_pzcrc_5()
{
  echo "## ----- PZC configuration file -----" >> ${_PZC_OUTPUT_FILE}
  echo "# Edit only lines marked with a TODO comment." >> ${_PZC_OUTPUT_FILE}
  echo "# You can add path dir or other configs in .zshrc." >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------ Config file version -------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "local _PZC_CONFIG_VERSION=(6 0 0)" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------- Log verbose level --------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}

  if [[ ${_PZC_LOG_INFO} = 1 ]]
  then
    echo "PZC_LOG_INFO=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "PZC_LOG_INFO=0" >> ${_PZC_OUTPUT_FILE}
  fi

  if [[ ${_PZC_LOG_WARNING} = 1 ]]
  then
    echo "PZC_LOG_WARNING=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "PZC_LOG_WARNING=0" >> ${_PZC_OUTPUT_FILE}
  fi

  if [[ ${_PZC_LOG_ERROR} = 1 ]]
  then
    echo "PZC_LOG_ERROR=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "PZC_LOG_ERROR=0" >> ${_PZC_OUTPUT_FILE}
  fi

  if [[ ${_PZC_LOG_DEBUG} = 1 ]]
  then
    echo "PZC_LOG_DEBUG=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "PZC_LOG_DEBUG=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ==================================" >> ${_PZC_OUTPUT_FILE}
  echo "# ==================================" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# -------- Work directories --------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Edit if you have an other large dir than your HOME" >> ${_PZC_OUTPUT_FILE}
  echo "#        for all default work/builds/installs/envi/ccache dirs." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_LARGE_DIR ]]
  then
    echo "local _PZC_LARGE_DIR=\"${_PZC_LARGE_DIR}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo 'local _PZC_LARGE_DIR=${HOME}' >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and edit if you have an other tmp dir than '/tmp/pzc'." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_TMP_DIR ]]
  then
    echo "export TMP_DIR=\"${_PZC_TMP_DIR}/pzc\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo '#export TMP_DIR="/tmp/pzc"' >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and edit if you want more specific directories for your" >> ${_PZC_OUTPUT_FILE}
  echo "#        working environment." >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] For your sources." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_WORK_DIR_PATH ]]
  then
    echo "export WORK_DIR=\"${_PZC_WORK_DIR_PATH}/work\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo '#export WORK_DIR="${_PZC_LARGE_DIR}/work"' >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}


  echo "# [TODO] To build your sources." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_BUILD_DIR_PATH ]] && [[ -v _PZC_INSTALL_DIR_PATH ]]
  then
    echo "export BUILD_DIR=\"${_PZC_BUILD_DIR_PATH}/build\"" >> ${_PZC_OUTPUT_FILE}
    echo "" >> ${_PZC_OUTPUT_FILE}
    echo "# [TODO] To install your sources." >> ${_PZC_OUTPUT_FILE}
    echo "export INSTALL_DIR=\"${_PZC_INSTALL_DIR_PATH}/install\"" >> ${_PZC_OUTPUT_FILE}

  elif [[ -v _PZC_BUILD_DIR_PATH ]]
  then
    _pzc_warning "Your build dir and your install dir are the same. Now, we recommend separating them."
    echo "export BUILD_DIR=\"${_PZC_BUILD_DIR_PATH}/build_install\"" >> ${_PZC_OUTPUT_FILE}
    echo "" >> ${_PZC_OUTPUT_FILE}
    echo "# [TODO] To install your sources." >> ${_PZC_OUTPUT_FILE}
    echo "export INSTALL_DIR=\"${_PZC_BUILD_DIR_PATH}/build_install\"" >> ${_PZC_OUTPUT_FILE}

  elif [[ -v _PZC_INSTALL_DIR_PATH ]]
  then
    echo '#export BUILD_DIR="${_PZC_LARGE_DIR}/build"' >> ${_PZC_OUTPUT_FILE}
    echo "" >> ${_PZC_OUTPUT_FILE}
    echo "# [TODO] To install your sources." >> ${_PZC_OUTPUT_FILE}
    echo "export INSTALL_DIR=\"${_PZC_INSTALL_DIR_PATH}/install\"" >> ${_PZC_OUTPUT_FILE}

  else
    _pzc_warning "Your build dir and your install dir are the same. Now, we recommend separating them."
    echo 'export BUILD_DIR="${_PZC_LARGE_DIR}/build_install"' >> ${_PZC_OUTPUT_FILE}
    echo "" >> ${_PZC_OUTPUT_FILE}
    echo "# [TODO] To install your sources." >> ${_PZC_OUTPUT_FILE}
    echo 'export INSTALL_DIR="${_PZC_LARGE_DIR}/build_install"' >> ${_PZC_OUTPUT_FILE}

  fi
  echo "" >> ${_PZC_OUTPUT_FILE}


  echo "# [TODO] To configure your environment." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_ENVI_DIR_PATH ]]
  then
    echo "export ENVI_DIR=\"${_PZC_ENVI_DIR_PATH}/environment\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo '#export ENVI_DIR="${_PZC_LARGE_DIR}/environment"' >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] For CCache." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_CCACHE_DIR_PATH ]]
  then
    echo "export CCACHE_DIR=\"${_PZC_CCACHE_DIR_PATH}/ccache\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo '#export CCACHE_DIR=${BUILD_DIR}/ccache' >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ==================================" >> ${_PZC_OUTPUT_FILE}
  echo "# ==================================" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------- File editor ----------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and edit if you want to use an other file editor than 'vim'." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_FILE_EDITOR ]]
  then
    echo "PZC_FILE_EDITOR=\"${_PZC_FILE_EDITOR}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_FILE_EDITOR=vim" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# -------- SSH keys location -------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you want to use 'agee' and 'aged' functions." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_SSH_PUB ]]
  then
    echo "PZC_SSH_PUB=\"${_PZC_SSH_PUB}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_SSH_PUB=" >> ${_PZC_OUTPUT_FILE}
  fi
  if [[ -v _PZC_SSH_PRI ]]
  then
    echo "PZC_SSH_PRI=\"${_PZC_SSH_PRI}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_SSH_PRI=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------- OH-MY-POSH -----------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use Oh-My-Posh, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_OMP_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_OMP_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_OMP_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of Oh-My-Posh (which is not in PATH)." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_OMP_BIN ]]
  then
    echo "local _PZC_OMP_BIN=\"${_PZC_OMP_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#local _PZC_OMP_BIN=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom Oh-My-Posh theme." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_OMP_THEME_FILE ]]
  then
    echo "local _PZC_OMP_THEME_FILE=\"${_PZC_OMP_THEME_FILE}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#local _PZC_OMP_THEME_FILE=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------------ AGE/RAGE ------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use age or rage, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_AGE_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_AGE_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_AGE_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of age or rage (which is not in PATH)." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_AGE_BIN ]]
  then
    echo "PZC_AGE_BIN=\"${_PZC_AGE_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_AGE_BIN=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------------- EZA-LS -------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use eza-ls, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_EZA_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_EZA_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_EZA_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of EZA-LS (which is not in PATH)." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_EZA_BIN ]]
  then
    echo "PZC_EZA_BIN=\"${_PZC_EZA_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_EZA_BIN=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom EZA theme." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_EZA_CONFIG_DIR ]]
  then
    echo "local _PZC_EZA_CONFIG_DIR=\"${_PZC_EZA_CONFIG_DIR}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#local _PZC_EZA_CONFIG_DIR=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------------- CCACHE -------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use ccache, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_CCACHE_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_CCACHE_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_CCACHE_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of ccache (which is not in PATH)." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_CCACHE_BIN ]]
  then
    echo "PZC_CCACHE_BIN=\"${_PZC_CCACHE_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_CCACHE_BIN=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# -------------- MOLD --------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use mold, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_MOLD_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_MOLD_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_MOLD_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of mold." >> ${_PZC_OUTPUT_FILE}
  echo "# Note: This PATH will be add in PATH." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_MOLD_PATH ]]
  then
    echo "local _PZC_MOLD_PATH=\"${_PZC_MOLD_PATH}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#local _PZC_MOLD_PATH=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------------- NINJA --------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use ninja, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_NINJA_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_NINJA_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_NINJA_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of ninja." >> ${_PZC_OUTPUT_FILE}
  echo "# Note: This PATH will be add in PATH." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_NINJA_PATH ]]
  then
    echo "local _PZC_NINJA_PATH=\"${_PZC_NINJA_PATH}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#local _PZC_NINJA_PATH=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------------- CMAKE --------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use cmake, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_CMAKE_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_CMAKE_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_CMAKE_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of cmake." >> ${_PZC_OUTPUT_FILE}
  echo "# Note: This PATH will be add in PATH." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_CMAKE_PATH ]]
  then
    echo "local _PZC_CMAKE_PATH=\"${_PZC_CMAKE_PATH}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#local _PZC_CMAKE_PATH=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ---------- TASKWARRIOR -----------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use taskwarrior, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_TASK_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_TASK_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_TASK_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of taskwarrior." >> ${_PZC_OUTPUT_FILE}
  echo "# Note: This PATH will be add in PATH." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_TASK_PATH ]]
  then
    echo "local _PZC_TASK_PATH=\"${_PZC_TASK_PATH}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#local _PZC_TASK_PATH=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------------- PYTHON -------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] If you want to use python, set this variable to 1." >> ${_PZC_OUTPUT_FILE}
  echo "local _PZC_PYTHON_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a custom installation of python." >> ${_PZC_OUTPUT_FILE}
  echo "# Note: This PATH will be add in PATH." >> ${_PZC_OUTPUT_FILE}
  echo "#local _PZC_PYTHON_PATH=" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------- COMPILERS ------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}

  echo "# [TODO] Setup available compilers." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_C_CXX_DEFAULT_COMPILER} = "CLANG" ]]
  then
    echo "local _PZC_C_CXX_DEFAULT_COMPILER=CLANG # Or GCC" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_C_CXX_DEFAULT_COMPILER=GCC # Or CLANG" >> ${_PZC_OUTPUT_FILE}
  fi

  echo "" >> ${_PZC_OUTPUT_FILE}

  if [[ ${_PZC_GCC_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_GCC_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_GCC_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi

  if [[ -v PZC_C_GCC_BIN ]]
  then
    echo "PZC_C_GCC_BIN=\"${PZC_C_GCC_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_C_GCC_BIN=gcc" >> ${_PZC_OUTPUT_FILE}
  fi

  if [[ -v PZC_CXX_GCC_BIN ]]
  then
    echo "PZC_CXX_GCC_BIN=\"${PZC_CXX_GCC_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_CXX_GCC_BIN=g++" >> ${_PZC_OUTPUT_FILE}
  fi


  echo "" >> ${_PZC_OUTPUT_FILE}


  if [[ ${_PZC_CLANG_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_CLANG_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_CLANG_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi


  if [[ -v PZC_C_CLANG_BIN ]]
  then
    echo "PZC_C_CLANG_BIN=\"${PZC_C_CLANG_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_C_CLANG_BIN=clang" >> ${_PZC_OUTPUT_FILE}
  fi
  if [[ -v PZC_CXX_CLANG_BIN ]]
  then
    echo "PZC_CXX_CLANG_BIN=\"${PZC_CXX_CLANG_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_CXX_CLANG_BIN=clang++" >> ${_PZC_OUTPUT_FILE}
  fi

  echo "" >> ${_PZC_OUTPUT_FILE}


  if [[ ${_PZC_GPU_DEFAULT_COMPILER} = "SYCL" ]]
  then
    echo "PZC_GPU_DEFAULT_COMPILER=SYCL # Or NVCC" >> ${_PZC_OUTPUT_FILE}

  elif [[ ${_PZC_GPU_DEFAULT_COMPILER} = "NVCC" ]]
  then
    echo "PZC_GPU_DEFAULT_COMPILER=NVCC # Or SYCL" >> ${_PZC_OUTPUT_FILE}

  else
    echo "#PZC_GPU_DEFAULT_COMPILER=NVCC # Or SYCL" >> ${_PZC_OUTPUT_FILE}

  fi

  if [[ -v _PZC_GPU_TARGET_ARCH ]]
  then
    echo "PZC_GPU_TARGET_ARCH=\"${_PZC_GPU_TARGET_ARCH}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_GPU_TARGET_ARCH=\"89\"" >> ${_PZC_OUTPUT_FILE}
  fi


  echo "" >> ${_PZC_OUTPUT_FILE}


  if [[ ${_PZC_NVCC_BIN_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_NVCC_BIN_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_NVCC_BIN_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi


  if [[ -v PZC_NVCC_BIN ]]
  then
    echo "PZC_NVCC_BIN=\"${PZC_NVCC_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_NVCC_BIN=nvcc" >> ${_PZC_OUTPUT_FILE}
  fi


  if [[ -v PZC_NVCC_HOST_COMPILER_BIN ]]
  then
    echo "PZC_NVCC_HOST_COMPILER_BIN=\"${PZC_NVCC_HOST_COMPILER_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_NVCC_HOST_COMPILER_BIN=g++-12" >> ${_PZC_OUTPUT_FILE}
  fi

  echo "" >> ${_PZC_OUTPUT_FILE}


  if [[ ${_PZC_SYCL_BIN_AVAILABLE} = 1 ]]
  then
    echo "local _PZC_SYCL_BIN_AVAILABLE=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "local _PZC_SYCL_BIN_AVAILABLE=0" >> ${_PZC_OUTPUT_FILE}
  fi

  if [[ -v PZC_SYCL_BIN ]]
  then
    echo "PZC_SYCL_BIN=\"${PZC_SYCL_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_SYCL_BIN=sycl" >> ${_PZC_OUTPUT_FILE}
  fi

  if [[ -v PZC_SYCL_HOST_COMPILER_BIN ]]
  then
    echo "PZC_SYCL_HOST_COMPILER_BIN=\"${PZC_SYCL_HOST_COMPILER_BIN}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_SYCL_HOST_COMPILER_BIN=clang++" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] In case of problem with permissions after compiling," >> ${_PZC_OUTPUT_FILE}
  echo "# set this option to 1." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_CHMOD_COMPILING} = 1 ]]
  then
    echo "PZC_CHMOD_COMPILING=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_CHMOD_COMPILING=1" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ---------- TODOlist path ---------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and complete if you have a todolist." >> ${_PZC_OUTPUT_FILE}
  if [[ -v _PZC_TODOLIST_PATH ]]
  then
    echo "PZC_TODOLIST_PATH=\"${_PZC_TODOLIST_PATH}\"" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#PZC_TODOLIST_PATH=" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment and edit if your todolist is encrypted (1) or not (0)." >> ${_PZC_OUTPUT_FILE}
  if [[ ${_PZC_TODOLIST_ENC} = 1 ]]
  then
    echo "local _PZC_TODOLIST_ENC=1" >> ${_PZC_OUTPUT_FILE}
  else
    echo "#local _PZC_TODOLIST_ENC=0" >> ${_PZC_OUTPUT_FILE}
  fi
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ------------- Other --------------" >> ${_PZC_OUTPUT_FILE}
  echo "# ----------------------------------" >> ${_PZC_OUTPUT_FILE}
  echo "# [TODO] Uncomment to disable welcome message." >> ${_PZC_OUTPUT_FILE}
  echo "#local _PZC_DISABLE_WELCOME=1" >> ${_PZC_OUTPUT_FILE}
  echo "" >> ${_PZC_OUTPUT_FILE}
}

_pzc_update_pzcrc_620()
{
  awk '/# ------------- PYTHON -------------/ {
    print "# ------------- ATUIN --------------"
    print "# ----------------------------------"
    print "# [TODO] If you want to use atuin, set this variable to 1."
    print "local _PZC_ATUIN_AVAILABLE=1"
    print ""
    print "# [TODO] Uncomment and complete if you have a custom installation of atuin (which is not in PATH)."
    print "#PZC_ATUIN_BIN="
    print ""
    print ""
    print "# ----------------------------------"
    print "# ------------- PYTHON -------------"
    next
  } 
  /local _PZC_CONFIG_VERSION=\(6 0 0\)/ {
    print "local _PZC_CONFIG_VERSION=(6 2 0)"
    next
  }
  1
  ' ${_PZC_OUTPUT_FILE_TMP} > ${_PZC_OUTPUT_FILE}
}

_pzc_update_pzcrc_640()
{
  awk '/PZC_ATUIN_BIN/ {
    print;
    print ""
    print "# [TODO] If you want to use atuin config file provided by PZC, set this variable to 1."
    print "local _PZC_ATUIN_USE_PZC_CONFIG=1"
    next
  } 
  /local _PZC_CONFIG_VERSION=\(6 2 0\)/ {
    print "local _PZC_CONFIG_VERSION=(6 4 0)"
    next
  }
  1
  ' ${_PZC_OUTPUT_FILE_TMP} > ${_PZC_OUTPUT_FILE}
}

_pzc_update_pzcrc_660()
{
  awk '/# ------------- PYTHON -------------/ {
    print "# -------------- FZF ---------------"
    print "# ----------------------------------"
    print "# [TODO] If you want to use fzf, set this variable to 1."
    print "local _PZC_FZF_AVAILABLE=1"
    print ""
    print "# [TODO] Uncomment and complete if you have a custom installation of fzf (which is not in PATH)."
    print "#PZC_FZF_BIN="
    print ""
    print ""
    print "# ----------------------------------"
    print "# ------------- PYTHON -------------"
    next
  } 
  /local _PZC_CONFIG_VERSION=\(6 4 0\)/ {
    print "local _PZC_CONFIG_VERSION=(6 6 0)"
    next
  }
  1
  ' ${_PZC_OUTPUT_FILE_TMP} > ${_PZC_OUTPUT_FILE}
}

_pzc_update_pzcrc_700()
{
  awk '/# ----------- OH-MY-POSH -----------/ {
    print "# --------- MISE-EN-PLACE ----------"
    print "# ----------------------------------"
    print "# [TODO] If you want to use mise, set this variable to 1."
    print "# Usefull to install tools after."
    print "local _PZC_MISE_AVAILABLE=1"
    print ""
    print "# [TODO] Uncomment and complete if you have a custom installation of mise (which is not in PATH)."
    print "#PZC_MISE_BIN="
    print ""
    print "# [TODO] Start Mise in same time than PZC (can be slow)."
    print "# If 0, function smise is available to initialize mise."
    print "# Needed to use tools installed with mise."
    print "local _PZC_MISE_START_AT_LAUNCH=1"
    print ""
    print ""
    print "# ----------------------------------"
    print "# ------------- SPACK --------------"
    print "# ----------------------------------"
    print ""
    print "# [TODO] If you want to use spack, set this variable to 1."
    print "local _PZC_SPACK_AVAILABLE=1"
    print ""
    print "# [TODO] Uncomment and complete if you have a custom installation of spack."
    print "# Without this var, default spack dir will be ${ENVI_DIR}/spack."
    print "#PZC_SPACK_PATH="
    print ""
    print "# [TODO] Start Spack in same time than PZC (can be slow)."
    print "# If 0, function ssp is available to source spack."
    print "local _PZC_SPACK_START_AT_LAUNCH=0"
    print ""
    print ""
    print "# ----------------------------------"
    print "# ----------- OH-MY-POSH -----------"
    next
  } 
  /local _PZC_CONFIG_VERSION=\(6 6 0\)/ {
    print "local _PZC_CONFIG_VERSION=(7 0 0)"
    next
  }
  1
  ' ${_PZC_OUTPUT_FILE_TMP} > ${_PZC_OUTPUT_FILE}
}

_pzc_update_pzcrc_790()
{
  awk '/# ------------- PYTHON -------------/ {
    print "# -------------- YAZI --------------"
    print "# ----------------------------------"
    print "# [TODO] If you want to use yazi, set this variable to 1."
    print "local _PZC_YAZI_AVAILABLE=1"
    print ""
    print "# [TODO] Uncomment and complete if you have a custom installation of yazi (which is not in PATH)."
    print "#PZC_YAZI_BIN="
    print ""
    print ""
    print "# ----------------------------------"
    print "# ------------- PYTHON -------------"
    next
  } 
  /local _PZC_CONFIG_VERSION=\(7 0 0\)/ {
    print "local _PZC_CONFIG_VERSION=(7 9 0)"
    next
  }
  1
  ' ${_PZC_OUTPUT_FILE_TMP} > ${_PZC_OUTPUT_FILE}
}

_pzc_launch_pzc_update()
{
  mv ${PZC_PZC_OLD_CONFIG_FILE} ${PZC_PZC_OLD_CONFIG_FILE}.old
  _pzc_info "A copy of your old pzcrc is available here: ${PZC_PZC_OLD_CONFIG_FILE}.old"

  local _PZC_OUTPUT_FILE="${PZC_PZC_OLD_CONFIG_FILE}"
  local _PZC_OUTPUT_FILE_TMP="${PZC_PZC_OLD_CONFIG_FILE}.tmp"

  if [[ ${_PZC_CONFIG_VERSION[1]} -eq 5 ]]
  then
    _pzc_info "Updating from .zshrc file (PZC v5 or lower) to v6.0.0 pzcrc file..."
    _pzc_pensil_begin
    echo "Changelog pzcrc configuration file (v6.0.0)"
    echo "----"
    echo "Initial pzcrc config file. Welcome to PZC v6 !"
    _pzc_pensil_end

    _pzc_update_pzcrc_5
    _PZC_CONFIG_VERSION=(6 0 0)
  else
    cp ${PZC_PZC_OLD_CONFIG_FILE}.old ${_PZC_OUTPUT_FILE}
  fi

  if [[ ${_PZC_CONFIG_VERSION[1]} -eq 6 ]] && [[ ${_PZC_CONFIG_VERSION[2]} -eq 0 ]] && [[ ${_PZC_CONFIG_VERSION[3]} -eq 0 ]]
  then
    _pzc_info "Updating from v6.0.0 pzcrc file to v6.2.0 pzcrc file..."
    _pzc_pensil_begin
    echo "Changelog pzcrc configuration file (v6.0.0 -> v6.2.0)"
    echo "----"
    echo "Add Atuin (https://github.com/atuinsh/atuin) support."
    _pzc_pensil_end

    mv ${_PZC_OUTPUT_FILE} ${_PZC_OUTPUT_FILE_TMP}
    _pzc_update_pzcrc_620
    rm ${_PZC_OUTPUT_FILE_TMP}
    _PZC_CONFIG_VERSION=(6 2 0)
  fi

  if [[ ${_PZC_CONFIG_VERSION[1]} -eq 6 ]] && [[ ${_PZC_CONFIG_VERSION[2]} -eq 2 ]] && [[ ${_PZC_CONFIG_VERSION[3]} -eq 0 ]]
  then
    _pzc_info "Updating from v6.2.0 pzcrc file to v6.4.0 pzcrc file..."
    _pzc_pensil_begin
    echo "Changelog pzcrc configuration file (v6.2.0 -> v6.4.0)"
    echo "----"
    echo "Add Atuin config file path and a config file in PZC."
    _pzc_pensil_end

    mv ${_PZC_OUTPUT_FILE} ${_PZC_OUTPUT_FILE_TMP}
    _pzc_update_pzcrc_640
    rm ${_PZC_OUTPUT_FILE_TMP}
    _PZC_CONFIG_VERSION=(6 4 0)
  fi

  if [[ ${_PZC_CONFIG_VERSION[1]} -eq 6 ]] && [[ ${_PZC_CONFIG_VERSION[2]} -eq 4 ]] && [[ ${_PZC_CONFIG_VERSION[3]} -eq 0 ]]
  then
    _pzc_info "Updating from v6.4.0 pzcrc file to v6.6.0 pzcrc file..."
    _pzc_pensil_begin
    echo "Changelog pzcrc configuration file (v6.4.0 -> v6.6.0)"
    echo "----"
    echo "Add FZF (https://github.com/junegunn/fzf) support."
    _pzc_pensil_end

    mv ${_PZC_OUTPUT_FILE} ${_PZC_OUTPUT_FILE_TMP}
    _pzc_update_pzcrc_660
    rm ${_PZC_OUTPUT_FILE_TMP}
    _PZC_CONFIG_VERSION=(6 6 0)
  fi

  if [[ ${_PZC_CONFIG_VERSION[1]} -eq 6 ]] && [[ ${_PZC_CONFIG_VERSION[2]} -eq 6 ]] && [[ ${_PZC_CONFIG_VERSION[3]} -eq 0 ]]
  then
    _pzc_info "Updating from v6.6.0 pzcrc file to v7.0.0 pzcrc file..."
    _pzc_pensil_begin
    echo "Changelog pzcrc configuration file (v6.6.0 -> v7.0.0)"
    echo "----"
    echo "Add Mise-en-place (https://github.com/jdx/mise) and Spack (https://github.com/spack/spack) support."
    _pzc_pensil_end

    mv ${_PZC_OUTPUT_FILE} ${_PZC_OUTPUT_FILE_TMP}
    _pzc_update_pzcrc_700
    rm ${_PZC_OUTPUT_FILE_TMP}
    _PZC_CONFIG_VERSION=(7 0 0)
  fi

  if [[ ${_PZC_CONFIG_VERSION[1]} -eq 7 ]] && [[ ${_PZC_CONFIG_VERSION[2]} -eq 0 ]] && [[ ${_PZC_CONFIG_VERSION[3]} -eq 0 ]]
  then
    _pzc_info "Updating from v7.0.0 pzcrc file to v7.9.0 pzcrc file..."
    _pzc_pensil_begin
    echo "Changelog pzcrc configuration file (v7.0.0 -> v7.9.0)"
    echo "----"
    echo "Add Yazi file manager (https://github.com/sxyazi/yazi) ! Available on Mise-en-place."
    _pzc_pensil_end

    mv ${_PZC_OUTPUT_FILE} ${_PZC_OUTPUT_FILE_TMP}
    _pzc_update_pzcrc_790
    rm ${_PZC_OUTPUT_FILE_TMP}
    _PZC_CONFIG_VERSION=(7 9 0)
  fi

  _pzc_info "Update of old file done. Restarting zsh to continue update..."
  read -s -k $'?Press any key to continue.\n'
  exec zsh
}


_pzc_launch_pzc_update_to_v800()
{
  PZC_NEW_JSON_V8="{}"



  PZC_NEW_JSON_V8=$(jq --argjson values '[8, 0, 0]' '.pzc_config_general.version = $values' <<<"${PZC_NEW_JSON_V8}")



  if [[ -v _PZC_FILE_EDITOR ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_FILE_EDITOR}" '.pzc_config_general.file_editor = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'vim' '.pzc_config_general.file_editor = $name' <<<"${PZC_NEW_JSON_V8}")
  fi



  if [[ ${_PZC_DISABLE_WELCOME} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_general.disable_welcome = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_general.disable_welcome = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi


  if [[ ${PZC_LOG_INFO} = 0 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_general.log_info = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_general.log_info = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ ${PZC_LOG_WARNING} = 0 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_general.log_warning = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_general.log_warning = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ ${PZC_LOG_ERROR} = 0 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_general.log_error = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_general.log_error = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ ${PZC_LOG_DEBUG} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_general.log_debug = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_general.log_debug = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ -v _PZC_LARGE_DIR ]] && [[ ${_PZC_LARGE_DIR} != "${HOME}" ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_LARGE_DIR}" '.pzc_config_dirs.large_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '${HOME}' '.pzc_config_dirs.large_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  fi



  if [[ -v TMP_DIR ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${TMP_DIR}" '.pzc_config_dirs.tmp_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '/tmp/pzc' '.pzc_config_dirs.tmp_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v WORK_DIR ]] && [[ ${WORK_DIR} != "${_PZC_LARGE_DIR}/work" ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${WORK_DIR}" '.pzc_config_dirs.work_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '${LARGE_DIR}/work' '.pzc_config_dirs.work_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v BUILD_DIR ]] && [[ ${BUILD_DIR} != "${_PZC_LARGE_DIR}/build" ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${BUILD_DIR}" '.pzc_config_dirs.build_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '${LARGE_DIR}/build' '.pzc_config_dirs.build_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v INSTALL_DIR ]] && [[ ${INSTALL_DIR} != "${_PZC_LARGE_DIR}/install" ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${INSTALL_DIR}" '.pzc_config_dirs.install_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '${LARGE_DIR}/install' '.pzc_config_dirs.install_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v ENVI_DIR ]] && [[ ${ENVI_DIR} != "${_PZC_LARGE_DIR}/environment" ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${ENVI_DIR}" '.pzc_config_dirs.envi_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '${LARGE_DIR}/environment' '.pzc_config_dirs.envi_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v CCACHE_DIR ]] && [[ ${CCACHE_DIR} != "${BUILD_DIR}/ccache" ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${CCACHE_DIR}" '.pzc_config_dirs.ccache_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '${BUILD_DIR}/ccache' '.pzc_config_dirs.ccache_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  fi



  PZC_NEW_JSON_V8=$(jq --arg name 'GCC or CLANG' '.pzc_config_compilers."#1" = $name' <<<"${PZC_NEW_JSON_V8}")



  if [[ ${_PZC_C_CXX_DEFAULT_COMPILER} == "CLANG" ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name 'CLANG' '.pzc_config_compilers.c_cxx_default_compiler = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'GCC' '.pzc_config_compilers.c_cxx_default_compiler = $name' <<<"${PZC_NEW_JSON_V8}")
  fi



  if [[ ${_PZC_GCC_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_compilers.gcc.available = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_compilers.gcc.available = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_C_GCC_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_C_GCC_BIN}" '.pzc_config_compilers.gcc.c_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'gcc' '.pzc_config_compilers.gcc.c_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_CXX_GCC_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_CXX_GCC_BIN}" '.pzc_config_compilers.gcc.cc_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'g++' '.pzc_config_compilers.gcc.cc_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi



  if [[ ${_PZC_CLANG_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_compilers.clang.available = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_compilers.clang.available = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_C_CLANG_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_C_CLANG_BIN}" '.pzc_config_compilers.clang.c_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'clang' '.pzc_config_compilers.clang.c_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_CXX_CLANG_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_CXX_CLANG_BIN}" '.pzc_config_compilers.clang.cc_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'clang++' '.pzc_config_compilers.clang.cc_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi


  PZC_NEW_JSON_V8=$(jq --arg name 'NVCC or SYCL' '.pzc_config_compilers."#2" = $name' <<<"${PZC_NEW_JSON_V8}")



  if [[ ${PZC_GPU_DEFAULT_COMPILER} == "SYCL" ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name 'SYCL' '.pzc_config_compilers.gpu_default_compiler = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'NVCC' '.pzc_config_compilers.gpu_default_compiler = $name' <<<"${PZC_NEW_JSON_V8}")
  fi


  if [[ -v PZC_GPU_TARGET_ARCH ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_GPU_TARGET_ARCH}" '.pzc_config_compilers.gpu_target_arch = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '89' '.pzc_config_compilers.gpu_target_arch = $name' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_NVCC_BIN_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_compilers.nvcc.available = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_compilers.nvcc.available = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_NVCC_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_NVCC_BIN}" '.pzc_config_compilers.nvcc.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'nvcc' '.pzc_config_compilers.nvcc.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_NVCC_HOST_COMPILER_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_NVCC_HOST_COMPILER_BIN}" '.pzc_config_compilers.nvcc.host_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'g++' '.pzc_config_compilers.nvcc.host_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi



  if [[ ${_PZC_SYCL_BIN_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_compilers.sycl.available = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_compilers.sycl.available = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_SYCL_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_SYCL_BIN}" '.pzc_config_compilers.sycl.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'sycl' '.pzc_config_compilers.sycl.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_SYCL_HOST_COMPILER_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_SYCL_HOST_COMPILER_BIN}" '.pzc_config_compilers.sycl.host_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name 'clang++' '.pzc_config_compilers.sycl.host_executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_MISE_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.mise_en_place.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.mise_en_place.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_MISE_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_MISE_BIN}" '.pzc_config_pkgs.mise_en_place.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.mise_en_place.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_SPACK_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.spack.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.spack.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_SPACK_PATH ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_SPACK_PATH}" '.pzc_config_pkgs.spack.src_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.spack.src_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ ${_PZC_SPACK_START_AT_LAUNCH} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.spack.start_at_launch = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.spack.start_at_launch = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_OMP_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.oh_my_posh.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.oh_my_posh.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v _PZC_OMP_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_OMP_BIN}" '.pzc_config_pkgs.oh_my_posh.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.oh_my_posh.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v _PZC_OMP_THEME_FILE ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_OMP_THEME_FILE}" '.pzc_config_pkgs.oh_my_posh.theme_file = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.oh_my_posh.theme_file = $name' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_EZA_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.eza.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.eza.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_EZA_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_EZA_BIN}" '.pzc_config_pkgs.eza.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.eza.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v _PZC_EZA_CONFIG_DIR ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_EZA_CONFIG_DIR}" '.pzc_config_pkgs.eza.config_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.eza.config_dir = $name' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_CCACHE_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.ccache.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.ccache.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_CCACHE_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_CCACHE_BIN}" '.pzc_config_pkgs.ccache.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.ccache.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_MOLD_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.mold.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.mold.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v _PZC_MOLD_PATH ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_MOLD_PATH}/mold" '.pzc_config_pkgs.mold.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.mold.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_NINJA_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.ninja.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.ninja.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v _PZC_NINJA_PATH ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_NINJA_PATH}/ninja" '.pzc_config_pkgs.ninja.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.ninja.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi






  if [[ ${_PZC_CMAKE_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.cmake.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.cmake.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v _PZC_CMAKE_PATH ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_CMAKE_PATH}/cmake" '.pzc_config_pkgs.cmake.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.cmake.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi




  if [[ ${_PZC_TASK_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.taskwarrior.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.taskwarrior.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v _PZC_TASK_PATH ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_TASK_PATH}/task" '.pzc_config_pkgs.taskwarrior.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.taskwarrior.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi








  if [[ ${_PZC_ATUIN_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.atuin.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.atuin.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_ATUIN_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_ATUIN_BIN}" '.pzc_config_pkgs.atuin.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.atuin.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi


  PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.atuin.config_dir = $name' <<<"${PZC_NEW_JSON_V8}")







  if [[ ${_PZC_FZF_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.fzf.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.fzf.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_FZF_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_FZF_BIN}" '.pzc_config_pkgs.fzf.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.fzf.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi








  if [[ ${_PZC_YAZI_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.yazi.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.yazi.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v PZC_YAZI_BIN ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${PZC_YAZI_BIN}" '.pzc_config_pkgs.yazi.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.yazi.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi





  if [[ ${_PZC_PYTHON_AVAILABLE} = 1 ]]
  then
    PZC_NEW_JSON_V8=$(jq --argjson enabled true '.pzc_config_pkgs.python.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --argjson enabled false '.pzc_config_pkgs.python.enable = $enabled' <<<"${PZC_NEW_JSON_V8}")
  fi

  if [[ -v _PZC_PYTHON_PATH ]]
  then
    PZC_NEW_JSON_V8=$(jq --arg name "${_PZC_PYTHON_PATH}/python3" '.pzc_config_pkgs.python.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  else
    PZC_NEW_JSON_V8=$(jq --arg name '' '.pzc_config_pkgs.python.executable_path = $name' <<<"${PZC_NEW_JSON_V8}")
  fi


  printf '%s\n' "${PZC_NEW_JSON_V8}" > ${PZC_PZC_CONFIG_FILE_V8}
  if [[ $? != 0 ]]
  then
    _pzc_error "Error : cannot write JSON file (${PZC_PZC_CONFIG_FILE_V8})."
    _PZC_FATAL_ERROR=1
  else
    _pzc_info "Your config file has been updated to the new format ! (${PZC_PZC_CONFIG_FILE_V8})"
    _pzc_info "You can check it with command 'pzc_config' and delete old config file (${PZC_PZC_OLD_CONFIG_FILE})"
  fi
}

_pzc_check_update_before_v8()
{
  source "${PZC_PZC_OLD_CONFIG_FILE}"

  source ${PZC_PZC_DIR}/pzc/version.zsh
  source ${PZC_PZC_DIR}/pzc/core/update/version_checker.zsh

  local _PZC_VERSION_CHECKER_RET=0
  _pzc_version_checker ${_PZC_CONFIG_VERSION} ${_PZC_CONFIG_LAST_VERSION}

  if [[ ${_PZC_VERSION_CHECKER_RET} = 2 ]]
  then
    PZC_LOG_ERROR=1
    _pzc_error "PZC v${PZC_VERSION[1]}.${PZC_VERSION[2]}.${PZC_VERSION[3]} is too old to read your config file pzcrc. "
    echo "\033[0;101m\033[30m           Please update PZC ('cd \${PZC_PZC_DIR}' and 'git pull'). "
    echo "\033[0;101m\033[30m           Your pzcrc version:                           v${_PZC_CONFIG_VERSION[1]}.${_PZC_CONFIG_VERSION[2]}.${_PZC_CONFIG_VERSION[3]}    "
    echo "\033[0;101m\033[30m           Latest version supported by your PZC version: v${_PZC_CONFIG_LAST_VERSION[1]}.${_PZC_CONFIG_LAST_VERSION[2]}.${_PZC_CONFIG_LAST_VERSION[3]}    \033[0m"
    _PZC_FATAL_ERROR=1
    return 0

  elif [[ ${_PZC_VERSION_CHECKER_RET} = 1 ]]
  then
    PZC_LOG_INFO=1
    PZC_LOG_WARNING=1
    PZC_LOG_ERROR=1

    _pzc_info "Your pzcrc file was created by PZC before v8."
    _pzc_info "It's an old format file (ZSH script) and we must update it to the latest version (v7.9.0) before generate new format file (JSON)."
    _pzc_launch_pzc_update
    # Ne devrait pas aller ici.
    _PZC_FATAL_ERROR=1
    return 0

  else
    _pzc_debug "pzcrc Checker OK"
    _pzc_info "Welcome to PZC v8!"
    echo ""
    _pzc_info "Your pzcrc file was created by PZC before v8. Updating to v8.0.0 config file (JSON)..."
    echo ""
    _pzc_launch_pzc_update_to_v800
  fi

  unfunction _pzc_version_checker

  unfunction _pzc_update_pzcrc_5
  unfunction _pzc_launch_pzc_update
}
