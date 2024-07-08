#!/bin/bash
module use /software/projects/pawsey1016/setonix/2024.05/modules/zen3/gcc/12.2.0/
module load intel-tbb/2021.9.0-popklgx
module load boost/1.83.0-3nhulww
module load .zlib/1.3-l3er4yi
module load craype-accel-amd-gfx90a
module load cmake/3.27.7
module load rocm/5.6.1

export HIP_PLATFORM=amd
