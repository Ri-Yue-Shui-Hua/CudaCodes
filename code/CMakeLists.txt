cmake_minimum_required(VERSION 3.14)
project(testCuda)

set(CMAKE_CXX_STANDARD 14)
find_package(CUDA REQUIRED)

file(GLOB_RECURSE filelists ${CMAKE_CURRENT_SOURCE_DIR} *.cu)
message(STATUS ${mains})
foreach(mainfile IN LISTS filelists)
    # Get file name without directory
    get_filename_component(mainname ${mainfile} NAME_WE)
	Message("mainname:", ${mainname})
    cuda_add_executable(${mainname} ${mainfile})	
	
endforeach()