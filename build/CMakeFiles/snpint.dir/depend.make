# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

CMakeFiles/snpint.dir/GPUEngine.cu.o: \
 /opt/rocm/include/hip/amd_detail/amd_channel_descriptor.h \
 /opt/rocm/include/hip/amd_detail/amd_device_functions.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_atomic.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_common.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_runtime.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_runtime_pt_api.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_unsafe_atomics.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_vector_types.h \
 /opt/rocm/include/hip/amd_detail/amd_math_functions.h \
 /opt/rocm/include/hip/amd_detail/amd_surface_functions.h \
 /opt/rocm/include/hip/amd_detail/amd_warp_functions.h \
 /opt/rocm/include/hip/amd_detail/device_library_decls.h \
 /opt/rocm/include/hip/amd_detail/hip_fp16_math_fwd.h \
 /opt/rocm/include/hip/amd_detail/hip_ldg.h \
 /opt/rocm/include/hip/amd_detail/hip_prof_str.h \
 /opt/rocm/include/hip/amd_detail/host_defines.h \
 /opt/rocm/include/hip/amd_detail/llvm_intrinsics.h \
 /opt/rocm/include/hip/amd_detail/math_fwd.h \
 /opt/rocm/include/hip/amd_detail/ockl_image.h \
 /opt/rocm/include/hip/amd_detail/texture_fetch_functions.h \
 /opt/rocm/include/hip/amd_detail/texture_indirect_functions.h \
 /opt/rocm/include/hip/channel_descriptor.h \
 /opt/rocm/include/hip/driver_types.h \
 /opt/rocm/include/hip/hip_common.h \
 /opt/rocm/include/hip/hip_runtime.h \
 /opt/rocm/include/hip/hip_runtime_api.h \
 /opt/rocm/include/hip/hip_texture_types.h \
 /opt/rocm/include/hip/hip_vector_types.h \
 /opt/rocm/include/hip/hip_version.h \
 /opt/rocm/include/hip/library_types.h \
 /opt/rocm/include/hip/nvidia_detail/nvidia_channel_descriptor.h \
 /opt/rocm/include/hip/nvidia_detail/nvidia_hip_runtime.h \
 /opt/rocm/include/hip/nvidia_detail/nvidia_hip_runtime_api.h \
 /opt/rocm/include/hip/nvidia_detail/nvidia_hip_unsafe_atomics.h \
 /opt/rocm/include/hip/surface_types.h \
 /opt/rocm/include/hip/texture_types.h \
 /opt/rocm/include/rocm_smi/kfd_ioctl.h \
 /opt/rocm/include/rocm_smi/rocm_smi.h \
 /opt/rocm/include/thrust/detail/config.h \
 /opt/rocm/include/thrust/detail/config/compiler.h \
 /opt/rocm/include/thrust/detail/config/config.h \
 /opt/rocm/include/thrust/detail/config/cpp_compatibility.h \
 /opt/rocm/include/thrust/detail/config/cpp_dialect.h \
 /opt/rocm/include/thrust/detail/config/debug.h \
 /opt/rocm/include/thrust/detail/config/deprecated.h \
 /opt/rocm/include/thrust/detail/config/device_system.h \
 /opt/rocm/include/thrust/detail/config/exec_check_disable.h \
 /opt/rocm/include/thrust/detail/config/forceinline.h \
 /opt/rocm/include/thrust/detail/config/global_workarounds.h \
 /opt/rocm/include/thrust/detail/config/host_device.h \
 /opt/rocm/include/thrust/detail/config/host_system.h \
 /opt/rocm/include/thrust/detail/config/namespace.h \
 /opt/rocm/include/thrust/detail/config/simple_defines.h \
 /opt/rocm/include/thrust/detail/cpp11_required.h \
 /opt/rocm/include/thrust/detail/execution_policy.h \
 /opt/rocm/include/thrust/detail/functional.inl \
 /opt/rocm/include/thrust/detail/functional/actor.h \
 /opt/rocm/include/thrust/detail/functional/actor.inl \
 /opt/rocm/include/thrust/detail/functional/argument.h \
 /opt/rocm/include/thrust/detail/functional/composite.h \
 /opt/rocm/include/thrust/detail/functional/operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/arithmetic_operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/assignment_operator.h \
 /opt/rocm/include/thrust/detail/functional/operators/bitwise_operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/compound_assignment_operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/logical_operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/operator_adaptors.h \
 /opt/rocm/include/thrust/detail/functional/operators/relational_operators.h \
 /opt/rocm/include/thrust/detail/functional/placeholder.h \
 /opt/rocm/include/thrust/detail/functional/value.h \
 /opt/rocm/include/thrust/detail/pair.inl \
 /opt/rocm/include/thrust/detail/preprocessor.h \
 /opt/rocm/include/thrust/detail/raw_pointer_cast.h \
 /opt/rocm/include/thrust/detail/raw_reference_cast.h \
 /opt/rocm/include/thrust/detail/reference_forward_declaration.h \
 /opt/rocm/include/thrust/detail/swap.h \
 /opt/rocm/include/thrust/detail/tuple.inl \
 /opt/rocm/include/thrust/detail/tuple_meta_transform.h \
 /opt/rocm/include/thrust/detail/tuple_transform.h \
 /opt/rocm/include/thrust/detail/type_deduction.h \
 /opt/rocm/include/thrust/detail/type_traits.h \
 /opt/rocm/include/thrust/detail/type_traits/function_traits.h \
 /opt/rocm/include/thrust/detail/type_traits/has_nested_type.h \
 /opt/rocm/include/thrust/detail/type_traits/has_trivial_assign.h \
 /opt/rocm/include/thrust/detail/type_traits/is_metafunction_defined.h \
 /opt/rocm/include/thrust/detail/type_traits/pointer_traits.h \
 /opt/rocm/include/thrust/detail/type_traits/result_of_adaptable_function.h \
 /opt/rocm/include/thrust/detail/use_default.h \
 /opt/rocm/include/thrust/functional.h \
 /opt/rocm/include/thrust/iterator/detail/any_system_tag.h \
 /opt/rocm/include/thrust/iterator/detail/device_system_tag.h \
 /opt/rocm/include/thrust/iterator/detail/host_system_tag.h \
 /opt/rocm/include/thrust/iterator/detail/iterator_category_to_system.h \
 /opt/rocm/include/thrust/iterator/detail/iterator_category_to_traversal.h \
 /opt/rocm/include/thrust/iterator/detail/iterator_category_with_system_and_traversal.h \
 /opt/rocm/include/thrust/iterator/detail/iterator_traits.inl \
 /opt/rocm/include/thrust/iterator/detail/iterator_traversal_tags.h \
 /opt/rocm/include/thrust/iterator/detail/tuple_of_iterator_references.h \
 /opt/rocm/include/thrust/iterator/detail/universal_categories.h \
 /opt/rocm/include/thrust/iterator/iterator_categories.h \
 /opt/rocm/include/thrust/iterator/iterator_traits.h \
 /opt/rocm/include/thrust/pair.h \
 /opt/rocm/include/thrust/system/cuda/detail/error.inl \
 /opt/rocm/include/thrust/system/cuda/detail/guarded_cuda_runtime_api.h \
 /opt/rocm/include/thrust/system/cuda/detail/guarded_driver_types.h \
 /opt/rocm/include/thrust/system/cuda/error.h \
 /opt/rocm/include/thrust/system/detail/errno.h \
 /opt/rocm/include/thrust/system/detail/error_category.inl \
 /opt/rocm/include/thrust/system/detail/error_code.inl \
 /opt/rocm/include/thrust/system/detail/error_condition.inl \
 /opt/rocm/include/thrust/system/detail/system_error.inl \
 /opt/rocm/include/thrust/system/error_code.h \
 /opt/rocm/include/thrust/system/system_error.h \
 /opt/rocm/include/thrust/system_error.h \
 /opt/rocm/include/thrust/tuple.h \
 /opt/rocm/include/thrust/type_traits/integer_sequence.h \
 /opt/rocm/include/thrust/type_traits/logical_metafunctions.h \
 /opt/rocm/include/thrust/type_traits/void_t.h \
 /opt/rocm/include/thrust/version.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/Args.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/GPUEngine.cu \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/GPUEngine.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/GPUHandler.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/GPUKernels.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/Method.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/ResultView.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/SNPDB.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/ThreadPool.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/hostsystem/Buffer.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/hostsystem/BufferAllocator.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/hostsystem/BufferFactory.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/hostsystem/Device.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/hostsystem/GPU.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/hostsystem/HostSystem.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/hostsystem/ThreadUtils.h
CMakeFiles/snpint.dir/GPUKernels.cu.o: \
 /opt/rocm/include/hip/amd_detail/amd_channel_descriptor.h \
 /opt/rocm/include/hip/amd_detail/amd_device_functions.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_atomic.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_common.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_runtime.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_runtime_pt_api.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_unsafe_atomics.h \
 /opt/rocm/include/hip/amd_detail/amd_hip_vector_types.h \
 /opt/rocm/include/hip/amd_detail/amd_math_functions.h \
 /opt/rocm/include/hip/amd_detail/amd_surface_functions.h \
 /opt/rocm/include/hip/amd_detail/amd_warp_functions.h \
 /opt/rocm/include/hip/amd_detail/device_library_decls.h \
 /opt/rocm/include/hip/amd_detail/hip_fp16_math_fwd.h \
 /opt/rocm/include/hip/amd_detail/hip_ldg.h \
 /opt/rocm/include/hip/amd_detail/hip_prof_str.h \
 /opt/rocm/include/hip/amd_detail/host_defines.h \
 /opt/rocm/include/hip/amd_detail/llvm_intrinsics.h \
 /opt/rocm/include/hip/amd_detail/math_fwd.h \
 /opt/rocm/include/hip/amd_detail/ockl_image.h \
 /opt/rocm/include/hip/amd_detail/texture_fetch_functions.h \
 /opt/rocm/include/hip/amd_detail/texture_indirect_functions.h \
 /opt/rocm/include/hip/channel_descriptor.h \
 /opt/rocm/include/hip/driver_types.h \
 /opt/rocm/include/hip/hip_common.h \
 /opt/rocm/include/hip/hip_runtime.h \
 /opt/rocm/include/hip/hip_runtime_api.h \
 /opt/rocm/include/hip/hip_texture_types.h \
 /opt/rocm/include/hip/hip_vector_types.h \
 /opt/rocm/include/hip/hip_version.h \
 /opt/rocm/include/hip/library_types.h \
 /opt/rocm/include/hip/nvidia_detail/nvidia_channel_descriptor.h \
 /opt/rocm/include/hip/nvidia_detail/nvidia_hip_runtime.h \
 /opt/rocm/include/hip/nvidia_detail/nvidia_hip_runtime_api.h \
 /opt/rocm/include/hip/nvidia_detail/nvidia_hip_unsafe_atomics.h \
 /opt/rocm/include/hip/surface_types.h \
 /opt/rocm/include/hip/texture_types.h \
 /opt/rocm/include/thrust/detail/config.h \
 /opt/rocm/include/thrust/detail/config/compiler.h \
 /opt/rocm/include/thrust/detail/config/config.h \
 /opt/rocm/include/thrust/detail/config/cpp_compatibility.h \
 /opt/rocm/include/thrust/detail/config/cpp_dialect.h \
 /opt/rocm/include/thrust/detail/config/debug.h \
 /opt/rocm/include/thrust/detail/config/deprecated.h \
 /opt/rocm/include/thrust/detail/config/device_system.h \
 /opt/rocm/include/thrust/detail/config/exec_check_disable.h \
 /opt/rocm/include/thrust/detail/config/forceinline.h \
 /opt/rocm/include/thrust/detail/config/global_workarounds.h \
 /opt/rocm/include/thrust/detail/config/host_device.h \
 /opt/rocm/include/thrust/detail/config/host_system.h \
 /opt/rocm/include/thrust/detail/config/namespace.h \
 /opt/rocm/include/thrust/detail/config/simple_defines.h \
 /opt/rocm/include/thrust/detail/cpp11_required.h \
 /opt/rocm/include/thrust/detail/execution_policy.h \
 /opt/rocm/include/thrust/detail/functional.inl \
 /opt/rocm/include/thrust/detail/functional/actor.h \
 /opt/rocm/include/thrust/detail/functional/actor.inl \
 /opt/rocm/include/thrust/detail/functional/argument.h \
 /opt/rocm/include/thrust/detail/functional/composite.h \
 /opt/rocm/include/thrust/detail/functional/operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/arithmetic_operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/assignment_operator.h \
 /opt/rocm/include/thrust/detail/functional/operators/bitwise_operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/compound_assignment_operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/logical_operators.h \
 /opt/rocm/include/thrust/detail/functional/operators/operator_adaptors.h \
 /opt/rocm/include/thrust/detail/functional/operators/relational_operators.h \
 /opt/rocm/include/thrust/detail/functional/placeholder.h \
 /opt/rocm/include/thrust/detail/functional/value.h \
 /opt/rocm/include/thrust/detail/pair.inl \
 /opt/rocm/include/thrust/detail/preprocessor.h \
 /opt/rocm/include/thrust/detail/raw_pointer_cast.h \
 /opt/rocm/include/thrust/detail/raw_reference_cast.h \
 /opt/rocm/include/thrust/detail/reference_forward_declaration.h \
 /opt/rocm/include/thrust/detail/swap.h \
 /opt/rocm/include/thrust/detail/tuple.inl \
 /opt/rocm/include/thrust/detail/tuple_meta_transform.h \
 /opt/rocm/include/thrust/detail/tuple_transform.h \
 /opt/rocm/include/thrust/detail/type_deduction.h \
 /opt/rocm/include/thrust/detail/type_traits.h \
 /opt/rocm/include/thrust/detail/type_traits/function_traits.h \
 /opt/rocm/include/thrust/detail/type_traits/has_nested_type.h \
 /opt/rocm/include/thrust/detail/type_traits/has_trivial_assign.h \
 /opt/rocm/include/thrust/detail/type_traits/is_metafunction_defined.h \
 /opt/rocm/include/thrust/detail/type_traits/pointer_traits.h \
 /opt/rocm/include/thrust/detail/type_traits/result_of_adaptable_function.h \
 /opt/rocm/include/thrust/detail/use_default.h \
 /opt/rocm/include/thrust/functional.h \
 /opt/rocm/include/thrust/iterator/detail/any_system_tag.h \
 /opt/rocm/include/thrust/iterator/detail/device_system_tag.h \
 /opt/rocm/include/thrust/iterator/detail/host_system_tag.h \
 /opt/rocm/include/thrust/iterator/detail/iterator_category_to_system.h \
 /opt/rocm/include/thrust/iterator/detail/iterator_category_to_traversal.h \
 /opt/rocm/include/thrust/iterator/detail/iterator_category_with_system_and_traversal.h \
 /opt/rocm/include/thrust/iterator/detail/iterator_traits.inl \
 /opt/rocm/include/thrust/iterator/detail/iterator_traversal_tags.h \
 /opt/rocm/include/thrust/iterator/detail/tuple_of_iterator_references.h \
 /opt/rocm/include/thrust/iterator/detail/universal_categories.h \
 /opt/rocm/include/thrust/iterator/iterator_categories.h \
 /opt/rocm/include/thrust/iterator/iterator_traits.h \
 /opt/rocm/include/thrust/pair.h \
 /opt/rocm/include/thrust/system/cuda/detail/error.inl \
 /opt/rocm/include/thrust/system/cuda/detail/guarded_cuda_runtime_api.h \
 /opt/rocm/include/thrust/system/cuda/detail/guarded_driver_types.h \
 /opt/rocm/include/thrust/system/cuda/error.h \
 /opt/rocm/include/thrust/system/detail/errno.h \
 /opt/rocm/include/thrust/system/detail/error_category.inl \
 /opt/rocm/include/thrust/system/detail/error_code.inl \
 /opt/rocm/include/thrust/system/detail/error_condition.inl \
 /opt/rocm/include/thrust/system/detail/system_error.inl \
 /opt/rocm/include/thrust/system/error_code.h \
 /opt/rocm/include/thrust/system/system_error.h \
 /opt/rocm/include/thrust/system_error.h \
 /opt/rocm/include/thrust/tuple.h \
 /opt/rocm/include/thrust/type_traits/integer_sequence.h \
 /opt/rocm/include/thrust/type_traits/logical_metafunctions.h \
 /opt/rocm/include/thrust/type_traits/void_t.h \
 /opt/rocm/include/thrust/version.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/GPUEngine.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/GPUKernels.cu \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/GPUKernels.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/Method.h \
 /software/projects/pawsey1016/espinosa/manual/software/SNPInt/snpint-gpu-amd/ResultView.h
