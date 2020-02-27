cmake_minimum_required(VERSION 2.6)
set(ixrx 				"i4r8")
set(ixrx_lib				"${w3emc}")
set(ixrx_Fortran_FLAGS			"${W3EMC_Fortran_FLAGS}")
set(ixrx_Fortran_MODULE_DIRECTORY	"${CMAKE_INCLUDE_OUTPUT_DIRECTORY}")
include(../ixrx.cmake)
#.
