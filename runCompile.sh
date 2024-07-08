#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu
#SBATCH --time=24:00:00
#SBATCH --account=pawsey0001-gpu


#--- Loading modules
module use /software/projects/pawsey1016/setonix/2024.05/modules/zen3/gcc/12.2.0
module load intel-tbb/2021.9.0-popklgx
module load boost/1.83.0-3nhulww
module load .zlib/1.3-l3er4yi
module load rocm/5.6.1
module load craype-accel-amd-gfx90a
module load cmake/3.27.7

CXX=hipcc cmake -S . -B build \
-DCMAKE_INSTALL_PREFIX=/software/projects/pawsey1016/espinosa/manual/rocThrust \
-DBUILD_TEST=ON -DBUILD_BENCHMARK=ON -DBUILD_EXAMPLES=ON
cmake --build build
ctest --output-on-failure
cmake --install build
