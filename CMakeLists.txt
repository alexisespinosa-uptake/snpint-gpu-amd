cmake_minimum_required(VERSION 3.3)
project(snpint C CXX HIP)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable verbose output
set(CMAKE_VERBOSE_MAKEFILE ON)

# Import local CMakeModules folder
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMakeModules")

execute_process(
    COMMAND git rev-parse --abbrev-ref HEAD
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE GIT_BRANCH
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
  COMMAND git log -1 --format=%h
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  OUTPUT_VARIABLE GIT_COMMIT_HASH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

configure_file(
    ${CMAKE_SOURCE_DIR}/version.h.template
    ${CMAKE_BINARY_DIR}/generated/version.h
)

# Find libraries
set(CMAKE_THREAD_PREFER_PTHREAD ON)
find_package(Threads REQUIRED)
find_package(OpenMP REQUIRED)
find_package(ZLIB REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem program_options)
find_package(TBB REQUIRED)

# HIP specific setup
find_package(HIP REQUIRED)
set(HIP_PLATFORM amd)
set(HIP_COMPILER clang)
set(HIP_RUNTIME rocclr)

# Set compiler flags for HIP
set(CMAKE_HIP_ARCHITECTURES gfx90a)
add_definitions(-D__HIP_PLATFORM_HCC__ -D__HIP_PLATFORM_AMD__)

# Collect linker options
set(linker_opts
  ${ZLIB_LIBRARIES}
  ${OpenMP_LIBRARIES}
  ${CMAKE_THREAD_LIBS_INIT}
  ${Boost_LIBRARIES}
  rt
  tbb
  rocm_smi
)

# Collect compiler options
set(cxx_compiler_opts
  ${OpenMP_CXX_FLAGS}
)

include_directories(
    SYSTEM "${ZLIB_INCLUDE_DIRS}"
    SYSTEM "${Boost_INCLUDE_DIRS}"
    "${CMAKE_BINARY_DIR}/generated"
    /opt/rocm/include  # Add the ROCm include directory here
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
target_link_libraries(${PROJECT_NAME} PRIVATE ${linker_opts})
