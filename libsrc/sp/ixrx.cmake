# This is a cmake include segment, invoked from ./i4r4 or ./i4r8.  It
# is written in a generic form with parameters specified by 
#   i4r4/CMakeLists.txt
#   i4r8/CMakeLists.txt
#
# Expected parameters: (see i4r4/CMakeLists.txt and i4r8/CMakeLists.txt)
#
#   irix : reference for the lib-varient cmake module
#   irix_lib : name of the lib-varient.
#   irix_Fortran_FLAGS : Fortran_FLAGS used to the lib-varient.
#   irix_Fortran_MODULE_DIRECTORY : Fortran_MODULE_DIRECTORY (where to leave
#	the .mod files of the lib-varent module).

  file(GLOB SRCS ../*.[fF])	# invoked from subdirectory CMakeLists.txt files
  set_source_files_properties( ${SRCS} COMPILE_FLAGS ${ixrx_Fortran_FLAGS})

  add_library( ${ixrx_lib} STATIC ${SRCS})
  set_target_properties( ${ixrx_lib} PROPERTIES Fortran_MODULE_DIRECTORY ${ixrx_Fortran_MODULE_DIRECTORY} )

#  message("HEY sp ${ixrx} lib is named ${ixrx_lib}")
#  message("HEY sp ${ixrx} Fortran_FLAGS are ${ixrx_Fortran_FLAGS}")
#  message("HEY sp ${ixrx} Fortran_MODULE_DIRECTORY is at ${ixrx_Fortran_MODULE_DIRECTORY}")

