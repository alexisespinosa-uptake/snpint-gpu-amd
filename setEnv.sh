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

# Improving the inclusion paths
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:${ROCM_PATH}/include:${ROCM_PATH}/hip/include:${ROCM_PATH}/llvm/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ROCM_PATH}/lib:${ROCM_PATH}/hip/lib:${ROCM_PATH}/llvm/lib:/opt/cray/pe/mpich/8.1.27/gtl/lib:/opt/cray/xpmem/2.5.2-2.4_3.47__gd0f7936.shasta/lib64:/opt/cray/pe/dsmml/0.2.2/dsmml/lib
export LIBRARY_PATH=$LIBRARY_PATH:${ROCM_PATH}/lib:${ROCM_PATH}/hip/lib:${ROCM_PATH}/llvm/lib:/opt/cray/pe/mpich/8.1.27/gtl/lib:/opt/cray/xpmem/2.5.2-2.4_3.47__gd0f7936.shasta/lib64:/opt/cray/pe/dsmml/0.2.2/dsmml/lib

# Extra flags to enable GPU support
export HIP_PLATFORM=amd
export GPU_ARCH="gfx90a"
export MPICH_GPU_SUPPORT_ENABLED=1

# Any extra MPI libs here
export MPI_EXTRA_LIBS="-L${CRAY_MPICH_ROOTDIR}/gtl/lib -lmpi_gtl_hsa"

# Using the "raw" hipcc compiler
unset CC CXX
export CC=${ROCM_PATH}/bin/hipcc
export CXX=${ROCM_PATH}/bin/hipcc

