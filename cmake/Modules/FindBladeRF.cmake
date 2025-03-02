# - Find BLADERF
# Find the native BLADERF includes and library
# This module defines
#  BLADERF_INCLUDE_DIR, where to find bladerf.h, etc.
#  BLADERF_LIBRARIES, the libraries needed to use BLADERF.
#  BLADERF_FOUND, If false, do not try to use BLADERF.
# also defined, but not for general use are
#  BLADERF_LIBRARY, where to find the BLADERF library.

FIND_PATH(BLADERF_INCLUDE_DIR libbladeRF.h
        ${BLADERF_DIR}/include
        /opt/homebrew/include
        /opt/local/include
        /usr/include
        /usr/local/include
)

FIND_LIBRARY(BLADERF_LIBRARY bladeRF)

IF (BLADERF_LIBRARY AND BLADERF_INCLUDE_DIR)
    SET(BLADERF_LIBRARIES ${BLADERF_LIBRARY})
    SET(BLADERF_FOUND "YES")
ELSE (BLADERF_LIBRARY AND BLADERF_INCLUDE_DIR)
    SET(BLADERF_FOUND "NO")
ENDIF (BLADERF_LIBRARY AND BLADERF_INCLUDE_DIR)

IF (BLADERF_FOUND)
    IF (NOT BLADERF_FIND_QUIETLY)
        MESSAGE(STATUS "Found bladeRF: ${BLADERF_LIBRARIES}")
    ENDIF (NOT BLADERF_FIND_QUIETLY)
ELSE (BLADERF_FOUND)
    IF (BLADERF_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find bladeRF library")
    ENDIF (BLADERF_FIND_REQUIRED)
ENDIF (BLADERF_FOUND)

# Deprecated declarations.
GET_FILENAME_COMPONENT (NATIVE_BLADERF_LIB_PATH ${BLADERF_LIBRARY} PATH)

MARK_AS_ADVANCED(
        BLADERF_LIBRARY
        BLADERF_INCLUDE_DIR
)