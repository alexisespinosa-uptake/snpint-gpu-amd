cmake_minimum_required(VERSION 3.3)

# Ensure ROCM_PATH is correctly set
if(NOT DEFINED ROCM_PATH)
    if(NOT DEFINED ENV{ROCM_PATH})
        set(ROCM_PATH "/opt/rocm/" CACHE PATH "Path to which ROCm has been installed")
    else()
        set(ROCM_PATH $ENV{ROCM_PATH} CACHE PATH "Path to which ROCm has been installed")
    endif()
else()
    set(ROCM_PATH ${ROCM_PATH} CACHE PATH "Path to which ROCm has been installed")
endif()

project(snpint 
  DESCRIPTION "HIPIfied project to run on Setonix AMD MI250X GPUs"
  LANGUAGES C CXX HIP
)

# Set the HIP compiler explicitly (Everything is compiled with HIP)
set(CMAKE_CXX_COMPILER "${ROCM_PATH}/bin/hipcc")
set(CMAKE_HIP_COMPILER "${ROCM_PATH}/bin/hipcc")

# Default CXX compiler flags
set(CMAKE_CXX_FLAGS "-g -fPIC -fopenmp -pthread")
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -Wall -Wextra -pedantic")
set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_DEBUG} --coverage")
set(CMAKE_CXX_FLAGS_PROFILE "-pg -O3")
set(CMAKE_CXX_FLAGS_RELEASE "-g -O3")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fopenmp -lpthread")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable verbose output
set(CMAKE_VERBOSE_MAKEFILE ON)

# Import local CMakeModules folder
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMakeModules")

configure_file(
    ${CMAKE_SOURCE_DIR}/version.h.template
    ${CMAKE_BINARY_DIR}/generated/version.h
)

# Find libraries
find_package(OpenMP REQUIRED)
find_package(ZLIB REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem program_options)
find_package(TBB REQUIRED)

# HIP specific setup
find_package(HIP REQUIRED)

# Set libraries for kernel code
set(kernel_libs hip::device)

# Set HIP platform and compiler
set(HIP_PLATFORM amd)
set(HIP_COMPILER clang)
set(HIP_RUNTIME rocclr)

# Set compiler flags for HIP
set(CMAKE_HIP_ARCHITECTURES "gfx90a")
add_definitions(-D__HIP_PLATFORM_HCC__ -D__HIP_PLATFORM_AMD__)

# HIP compile flags
set(CMAKE_HIP_FLAGS "${CMAKE_HIP_FLAGS} -g -fPIC -fopenmp")
set(CMAKE_HIP_FLAGS_DEBUG "-ggdb -O1")
set(CMAKE_HIP_FLAGS_PROFILE "-pg -O3")
set(CMAKE_HIP_FLAGS_RELEASE "-O3")

# Collect linker options
set(linker_opts
  ${ZLIB_LIBRARIES}
  ${OpenMP_LIBRARIES}
  ${CMAKE_THREAD_LIBS_INIT}
  ${Boost_LIBRARIES}
  rt
  tbb
  rocm_smi64
  amdhip64
  dl
  mpi_gtl_hsa
  dsmml
  xpmem
  stdc++
  quadmath
)

# Make sure the all target doesn't get brought in for install
set(CMAKE_SKIP_INSTALL_ALL_DEPENDENCY true)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")

# Collect compiler options
set(cxx_compiler_opts
  ${OpenMP_CXX_FLAGS}
)

include_directories(
    SYSTEM "${ZLIB_INCLUDE_DIRS}"
    SYSTEM "${Boost_INCLUDE_DIRS}"
    "${CMAKE_BINARY_DIR}/generated"
    SYSTEM "${ROCM_PATH}"
    SYSTEM "${ROCM_PATH}/include"
    SYSTEM "${CRAY_MPICH_PREFIX}/include"
    SYSTEM "${ROCM_PATH}/rocprofiler/include"
    SYSTEM "${ROCM_PATH}/roctracer/include"
    SYSTEM "${ROCM_PATH}/hip/include"
    SYSTEM "/opt/cray/xpmem/2.5.2-2.4_3.47__gd0f7936.shasta/include"
    SYSTEM "/opt/cray/pe/dsmml/0.2.2/dsmml/include"
)

link_directories(
    "${ROCM_PATH}/lib"
    "${CRAY_MPICH_PREFIX}/lib"
    "/opt/cray/pe/mpich/8.1.27/gtl/lib"
    "${ROCM_PATH}/lib64"
    "${ROCM_PATH}/rocprofiler/lib"
    "${ROCM_PATH}/rocprofiler/tool"
    "${ROCM_PATH}/roctracer/lib"
    "${ROCM_PATH}/roctracer/tool"
    "${ROCM_PATH}/hip/lib"
    "/opt/cray/xpmem/2.5.2-2.4_3.47__gd0f7936.shasta/lib64"
    "/opt/cray/pe/dsmml/0.2.2/dsmml/lib"
    "${CRAY_CXX_IPA_LIBS_X86_64}"
)

set(OPT_SCORE_TYPE double CACHE STRING "Score precision (double or float)")

add_definitions(
    -DSCORE_TYPE=${OPT_SCORE_TYPE}
    -DTBB_USE_EXCEPTIONS
)

set(CXX_WARNINGS "-Wall -Wextra -Wshadow -Wno-deprecated-declarations -Wmissing-include-dirs -Wstrict-aliasing=2 -Wfloat-equal -Wcast-align")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${cxx_compiler_opts} ${CXX_WARNINGS} -fopenmp -march=native")

# C++ source files (DO NOT change the next line, it's a script hook)
set(cpp_sources
    main.cpp
    version.cpp
    Args.cpp
    ThreadPool.h
    MinMaxHeap.h
    Histogram.h
    IDHandler.cpp
    GPUHandler.h
    ResultHandler.h
    SNPDB.cpp
    PlinkParser.cpp
    utils.h
    Method.cpp
    ResultView.h

    # Regarding host infrastructure
    hostsystem/ThreadUtils.cpp
    hostsystem/BufferAllocator.h
    hostsystem/BufferFactory.h
    hostsystem/Buffer.h
    hostsystem/DeviceCategory.cpp
    hostsystem/Device.h
    hostsystem/GPU.cpp
    hostsystem/HostSystem.cpp
    hostsystem/Spinlock.h

    # GPU-only stuff
    GPUKernels.cu
    GPUEngine.cu
)

add_definitions(
    -D_FORCE_INLINES
)

# Ensure kernel sources are compiled as HIP
set_source_files_properties(GPUKernels.cu GPUEngine.cu PROPERTIES LANGUAGE HIP)

# Add executable using add_executable
add_executable(${PROJECT_NAME} ${cpp_sources})

# Set the HIP compiler explicitly
set_target_properties(${PROJECT_NAME} PROPERTIES
  HIP_COMPILER hipcc
  HIP_ARCHITECTURES gfx90a
)

# Link libraries to the executable
target_link_libraries(${PROJECT_NAME} PRIVATE ${linker_opts} ${kernel_libs})
