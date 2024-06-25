set(CMAKE_HIP_COMPILER "/software/setonix/rocm/5.6.1/llvm/bin/clang++")
set(CMAKE_HIP_COMPILER_ID "Clang")
set(CMAKE_HIP_COMPILER_VERSION "16.0.0")
set(CMAKE_HIP_STANDARD_COMPUTED_DEFAULT "14")
set(CMAKE_HIP_EXTENSIONS_COMPUTED_DEFAULT "OFF")
set(CMAKE_HIP_COMPILE_FEATURES "hip_std_98;hip_std_11;hip_std_14;hip_std_17;hip_std_20;hip_std_23")
set(CMAKE_HIP98_COMPILE_FEATURES "")
set(CMAKE_HIP11_COMPILE_FEATURES "hip_std_11")
set(CMAKE_HIP14_COMPILE_FEATURES "hip_std_14")
set(CMAKE_HIP17_COMPILE_FEATURES "hip_std_17")
set(CMAKE_HIP20_COMPILE_FEATURES "hip_std_20")
set(CMAKE_HIP23_COMPILE_FEATURES "hip_std_23")

set(CMAKE_HIP_PLATFORM_ID "Linux")
set(CMAKE_HIP_SIMULATE_ID "")
set(CMAKE_HIP_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_HIP_SIMULATE_VERSION "")


set(CMAKE_HIP_COMPILER_ROCM_ROOT "/software/setonix/rocm/5.6.1")
set(CMAKE_HIP_COMPILER_ROCM_LIB "/software/setonix/rocm/5.6.1/lib")

set(CMAKE_HIP_COMPILER_ENV_VAR "HIPCXX")

set(CMAKE_HIP_COMPILER_LOADED 1)
set(CMAKE_HIP_COMPILER_ID_RUN 1)
set(CMAKE_HIP_SOURCE_FILE_EXTENSIONS hip)
set(CMAKE_HIP_LINKER_PREFERENCE 90)
set(CMAKE_HIP_LINKER_PREFERENCE_PROPAGATES 1)
set(CMAKE_HIP_LINKER_DEPFILE_SUPPORTED TRUE)

set(CMAKE_HIP_SIZEOF_DATA_PTR "8")
set(CMAKE_HIP_COMPILER_ABI "ELF")
set(CMAKE_HIP_LIBRARY_ARCHITECTURE "")

if(CMAKE_HIP_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_HIP_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_HIP_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_HIP_COMPILER_ABI}")
endif()

if(CMAKE_HIP_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_HIP_TOOLKIT_INCLUDE_DIRECTORIES "")

set(CMAKE_HIP_IMPLICIT_INCLUDE_DIRECTORIES "/software/setonix/2024.05/software/linux-sles15-zen3/gcc-12.2.0/zlib-1.3-l3er4yiit63tnf26cdwjfqpbvxlb2y43/include;/software/projects/pawsey1016/setonix/2024.05/software/linux-sles15-zen3/gcc-12.2.0/boost-1.83.0-3nhulwwtgncwcprf2n5fqmaflx6auesf/include;/software/projects/pawsey1016/setonix/2024.05/software/linux-sles15-zen3/gcc-12.2.0/intel-tbb-2021.9.0-popklgx6jgbnh4c6kyheotljtkqgjqci/include;/software/setonix/rocm/5.6.1/include;/software/setonix/rocm/5.6.1/llvm/lib/clang/16.0.0/include/cuda_wrappers;/usr/include/c++/7;/usr/include/c++/7/x86_64-suse-linux;/usr/include/c++/7/backward;/software/setonix/rocm/5.6.1/llvm/lib/clang/16.0.0/include;/usr/local/include;/usr/x86_64-suse-linux/include;/usr/include")
set(CMAKE_HIP_IMPLICIT_LINK_LIBRARIES "amdhip64;stdc++;m;gcc_s;c;gcc_s")
set(CMAKE_HIP_IMPLICIT_LINK_DIRECTORIES "/usr/lib64/gcc/x86_64-suse-linux/7;/usr/lib64;/lib64;/usr/x86_64-suse-linux/lib;/lib;/usr/lib;/software/setonix/2024.05/software/linux-sles15-zen3/gcc-12.2.0/zlib-1.3-l3er4yiit63tnf26cdwjfqpbvxlb2y43/lib;/software/projects/pawsey1016/setonix/2024.05/software/linux-sles15-zen3/gcc-12.2.0/boost-1.83.0-3nhulwwtgncwcprf2n5fqmaflx6auesf/lib;/software/projects/pawsey1016/setonix/2024.05/software/linux-sles15-zen3/gcc-12.2.0/intel-tbb-2021.9.0-popklgx6jgbnh4c6kyheotljtkqgjqci/lib64;/software/setonix/rocm/5.6.1/lib")
set(CMAKE_HIP_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")

set(CMAKE_HIP_RUNTIME_LIBRARY_DEFAULT "SHARED")

set(CMAKE_AR "/usr/bin/ar")
set(CMAKE_HIP_COMPILER_AR "/software/setonix/rocm/5.6.1/llvm/bin/llvm-ar")
set(CMAKE_RANLIB "/usr/bin/ranlib")
set(CMAKE_HIP_COMPILER_RANLIB "/software/setonix/rocm/5.6.1/llvm/bin/llvm-ranlib")
set(CMAKE_LINKER "/usr/bin/ld")
set(CMAKE_MT "")
set(CMAKE_TAPI "CMAKE_TAPI-NOTFOUND")