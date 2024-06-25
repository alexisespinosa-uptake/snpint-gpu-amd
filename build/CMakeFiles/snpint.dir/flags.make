# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# compile CXX with /opt/cray/pe/craype/2.7.23/bin/CC
# compile HIP with /software/setonix/rocm/5.6.1/llvm/bin/clang++
CXX_DEFINES = -DBOOST_ATOMIC_DYN_LINK -DBOOST_ATOMIC_NO_LIB -DBOOST_FILESYSTEM_DYN_LINK -DBOOST_FILESYSTEM_NO_LIB -DBOOST_PROGRAM_OPTIONS_DYN_LINK -DBOOST_PROGRAM_OPTIONS_NO_LIB -DSCORE_TYPE=double -DTBB_USE_EXCEPTIONS -D_FORCE_INLINES -D__HIP_PLATFORM_AMD__ -D__HIP_PLATFORM_HCC__

CXX_INCLUDES = -isystem /software/setonix/2024.05/software/linux-sles15-zen3/gcc-12.2.0/zlib-1.3-l3er4yiit63tnf26cdwjfqpbvxlb2y43/include -isystem /software/projects/pawsey1016/setonix/2024.05/software/linux-sles15-zen3/gcc-12.2.0/boost-1.83.0-3nhulwwtgncwcprf2n5fqmaflx6auesf/include -isystem /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/build/generated

CXX_FLAGS =  -fopenmp -Wall -Wextra -Wshadow -Wno-deprecated-declarations -Wmissing-include-dirs -Wstrict-aliasing=2 -Wfloat-equal -Wcast-align -fopenmp -march=native -O3 -DNDEBUG -std=gnu++17

HIP_DEFINES = -DBOOST_ATOMIC_DYN_LINK -DBOOST_ATOMIC_NO_LIB -DBOOST_FILESYSTEM_DYN_LINK -DBOOST_FILESYSTEM_NO_LIB -DBOOST_PROGRAM_OPTIONS_DYN_LINK -DBOOST_PROGRAM_OPTIONS_NO_LIB -DSCORE_TYPE=double -DTBB_USE_EXCEPTIONS -D_FORCE_INLINES -D__HIP_PLATFORM_AMD__ -D__HIP_PLATFORM_HCC__ -D__HIP_ROCclr__=1

HIP_INCLUDES = -isystem /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/build/generated -isystem /opt/rocm/include

HIP_FLAGS = -O3 -DNDEBUG -std=gnu++17 --offload-arch=gfx90a -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false
