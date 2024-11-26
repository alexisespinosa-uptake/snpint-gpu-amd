#    This file is part of SNPInt-GPU-AMD.
#    This version is the HIPified version of the original SNPInt-GPU project.
#    But all the authorship of the code corresponds to the original authors of SNPInt-GPU.
#    -------------------------
#    Original header comment is below:
#    -------------------------
#    Copyright 2019 Lars Wienbrandt, Jan Christian Kässens
#
#    This file is part of SNPInt-GPU.
#
#    SNPInt-GPU is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    SNPInt-GPU is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with SNPInt-GPU.  If not, see <https://www.gnu.org/licenses/>.
#    -------------------------

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

# Settings to override the Toolchain settings (Need to be placed before the project command)
#set(AMDGPU_TARGETS "gfx90a" CACHE STRING "AMD GPU targets to compile for") #This one seems to not be needed
set(GPU_TARGETS "gfx90a" CACHE STRING "GPU targets to compile for") #Single Target used for compilation of cpp files

project(snpint 
  DESCRIPTION "HIPified project to run on Setonix AMD MI250X GPUs"
  LANGUAGES C CXX HIP
)

# Set the HIP compiler explicitly (Everything is compiled with HIP)
set(CMAKE_CXX_COMPILER "${ROCM_PATH}/bin/hipcc")
set(CMAKE_HIP_COMPILER "${ROCM_PATH}/bin/hipcc")

# Default CXX compiler flags
set(CMAKE_CXX_FLAGS "-Wall -Wextra -Wpedantic -Wshadow -march=native -fopenmp -fPIC")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} -g -O0")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -O3 -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELEASETEST "${CMAKE_CXX_FLAGS} -O3")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS} -O2 -g")
set(CMAKE_CXX_FLAGS_MINSIZEREL "${CMAKE_CXX_FLAGS} -Os -DNDEBUG")
set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_DEBUG} --coverage")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_RELEASE} -pg")

# Ensure no duplicate or conflicting flags
set(CXX_WARNINGS "-Wall -Wextra -Wshadow -Wno-deprecated-declarations -Wmissing-include-dirs -Wstrict-aliasing=2 -Wfloat-equal -Wcast-align")
set(cxx_compiler_opts
  ${OpenMP_CXX_FLAGS}
)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${cxx_compiler_opts} ${CXX_WARNINGS} -fopenmp -march=native")

# Linker flags
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
set(CMAKE_HIP_FLAGS "${CMAKE_HIP_FLAGS} -fPIC -fopenmp")
set(CMAKE_HIP_FLAGS_DEBUG "${CMAKE_HIP_FLAGS} -ggdb -O0")
set(CMAKE_HIP_FLAGS_RELEASE "${CMAKE_HIP_FLAGS} -O3 -DNDEBUG")
set(CMAKE_HIP_FLAGS_RELEASETEST "${CMAKE_HIP_FLAGS} -O3")
set(CMAKE_HIP_FLAGS_RELWITHDEBINFO "${CMAKE_HIP_FLAGS} -O2 -g")
set(CMAKE_HIP_FLAGS_MINSIZEREL "${CMAKE_HIP_FLAGS} -Os -DNDEBUG")
set(CMAKE_HIP_FLAGS_COVERAGE "${CMAKE_HIP_FLAGS} -g -O0 --coverage")
set(CMAKE_HIP_FLAGS_PROFILE "${CMAKE_HIP_FLAGS} -O2 -pg")

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
  mpi
  mpi_gtl_hsa
  dsmml
  xpmem
)

# Make sure the all target doesn't get brought in for install
set(CMAKE_SKIP_INSTALL_ALL_DEPENDENCY true)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")

# Auxliliary variables for the include and link directories
if(NOT DEFINED MPICH_DIR)
    execute_process(
        COMMAND bash -c "echo $MPICH_DIR"
        OUTPUT_VARIABLE MPICH_DIR
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endif()
if(NOT DEFINED CRAY_MPICH_ROOTDIR)
    execute_process(
        COMMAND bash -c "echo $CRAY_MPICH_ROOTDIR"
        OUTPUT_VARIABLE CRAY_MPICH_ROOTDIR
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endif()
if(NOT DEFINED CRAY_DSMML_DIR)
    execute_process(
        COMMAND bash -c "echo $CRAY_DSMML_DIR"
        OUTPUT_VARIABLE CRAY_DSMML_DIR
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endif()
if(NOT DEFINED CRAY_XPMEM_INCLUDE_OPTS)
    execute_process(
        COMMAND bash -c "echo $CRAY_XPMEM_INCLUDE_OPTS"
        OUTPUT_VARIABLE CRAY_XPMEM_INCLUDE_OPTS
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endif()
if(NOT DEFINED CRAY_XPMEM_POST_LINK_OPTS)
    execute_process(
        COMMAND bash -c "echo $CRAY_XPMEM_POST_LINK_OPTS"
        OUTPUT_VARIABLE CRAY_XPMEM_POST_LINK_OPTS
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endif()
#message("ZLIB_INCLUDE_DIRS: ${ZLIB_INCLUDE_DIRS}")
#message("Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
#message("MPICH_DIR: ${MPICH_DIR}")
#message("ROCM_PATH: ${ROCM_PATH}")
#message("CRAY_DSMML_DIR: ${CRAY_DSMML_DIR}")
#message("CRAY_XPMEM_INCLUDE_OPTS: ${CRAY_XPMEM_INCLUDE_OPTS}")
#message("CRAY_XPMEM_POST_LINK_OPTS: ${CRAY_XPMEM_POST_LINK_OPTS}")
#message("CRAY_MPICH_ROOTDIR: ${CRAY_MPICH_ROOTDIR}")

string(REPLACE "-I" "" HERE_XPMEM_INCLUDE_PATH "${CRAY_XPMEM_INCLUDE_OPTS}")
string(REPLACE "-L" "" HERE_XPMEM_LIB_PATH "${CRAY_XPMEM_POST_LINK_OPTS}")
#message("HERE_XPMEM_INCLUDE_PATH: ${HERE_XPMEM_INCLUDE_PATH}")
#message("HERE_XPMEM_LIB_PATH: ${HERE_XPMEM_LIB_PATH}")

# Settings for the include and link directories
include_directories(
    SYSTEM "${ZLIB_INCLUDE_DIRS}"
    SYSTEM "${Boost_INCLUDE_DIRS}"
    "${CMAKE_BINARY_DIR}/generated"
    SYSTEM "${MPICH_DIR}/include"
    SYSTEM "${ROCM_PATH}"
    SYSTEM "${ROCM_PATH}/include"
    SYSTEM "${ROCM_PATH}/rocprofiler/include"
    SYSTEM "${ROCM_PATH}/roctracer/include"
    SYSTEM "${ROCM_PATH}/hip/include"
    SYSTEM "${CRAY_DSMML_DIR}/include"
    SYSTEM "${HERE_XPMEM_INCLUDE_PATH}"
)

link_directories(
    "${MPICH_DIR}/lib"
    "${CRAY_MPICH_ROOTDIR}/gtl/lib"
    "${ROCM_PATH}/lib64"
    "${ROCM_PATH}/lib"
    "${ROCM_PATH}/rocprofiler/lib"
    "${ROCM_PATH}/rocprofiler/tool"
    "${ROCM_PATH}/roctracer/lib"
    "${ROCM_PATH}/roctracer/tool"
    "${ROCM_PATH}/hip/lib"
    "${CRAY_DSMML_DIR}/lib"
    "${HERE_XPMEM_LIB_PATH}"
)

set(OPT_SCORE_TYPE double CACHE STRING "Score precision (double or float)")

add_definitions(
    -DSCORE_TYPE=${OPT_SCORE_TYPE}
    -DTBB_USE_EXCEPTIONS
)

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
  #HIP_ARCHITECTURES gfx90a #Already set lines above
)

# Link libraries to the executable
target_link_libraries(${PROJECT_NAME} PRIVATE ${linker_opts} ${kernel_libs})
