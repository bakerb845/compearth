# - Find the native MKL includes and library
#

# This module defines
#  MKL_LIBRARY, the libraries to link against to use MKL.
#  MKL_DEFINITIONS - You should ADD_DEFINITONS(${MKL_DEFINITIONS}) before compiling code that includes MKL library files.
#  MKL_FOUND, If false, do not try to use MKL.

SET(MKL_FOUND "NO")

MESSAGE("Searching for MKL")
SET(MKL_NAMES ${MKL_NAMES} mkl_intel_lp64 mkl_core mkl_sequential)
FOREACH (MKL_NAME ${MKL_NAMES})
   FIND_LIBRARY(${MKL_NAME}_LIBRARY
       NAMES ${MKL_NAME} 
       PATHS
       /opt/intel/mkl/lib/intel64
       $ENV{MKL_DIR}/lib/intel64
   )

   SET(TMP_LIBRARY ${${MKL_NAME}_LIBRARY})

   IF(TMP_LIBRARY)
      SET(MKL_LIBRARY ${MKL_LIBRARY} ${TMP_LIBRARY})
   ENDIF()
endforeach()

IF (MKL_LIBRARY)
    SET(MKL_LIBRARY ${MKL_LIBRARY})
    SET(MKL_FOUND "YES")
ENDIF (MKL_LIBRARY)

find_path (MKL_INCLUDE_DIR 
           NAMES mkl.h
           PATHS /opt/intel/mkl/include)


IF (NOT MKL_FOUND)
    IF (MKL_FIND_REQUIRED)
	MESSAGE(FATAL_ERROR "Could not find MKL library")
    ENDIF (MKL_FIND_REQUIRED)
ENDIF (NOT MKL_FOUND)

include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (MKL DEFAULT_MSG MKL_LIBRARY MKL_INCLUDE_DIR)
mark_as_advanced(MKL_LIBRARY MKL_LIBRARY)

