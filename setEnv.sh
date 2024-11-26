#!/bin/bash
# Load the modules for the dependencies
module use /software/projects/pawsey1016/setonix/2024.05/modules/zen3/gcc/12.2.0/
module load intel-tbb/2021.9.0-popklgx
module load boost/1.83.0-3nhulww
module load .zlib/1.3-l3er4yi

# Load the modules for compiling the code
module unload cray-libsci
module load craype-accel-amd-gfx90a
module load rocm/5.6.1
module load cmake/3.27.7

# Extra flags to enable GPU support
export HIP_PLATFORM=amd
export GPU_ARCH="gfx90a"
export MPICH_GPU_SUPPORT_ENABLED=1

# Using the "raw" hipcc compiler
unset CC CXX
export CC=${ROCM_PATH}/bin/hipcc
export CXX=${ROCM_PATH}/bin/hipcc

