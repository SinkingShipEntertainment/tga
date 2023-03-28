#[=======================================================================[.rst:
FindTGA
-------

Find libtga-lib, library for the Targa image format.

Result variables
^^^^^^^^^^^^^^^^

This module will set the following variables in your project:

``TGA_INCLUDE_DIRS``
  where to find tga.h, etc.
``TGA_LIBRARIES``
  the libraries to link against to use TGA.
``TGA_FOUND``
  If false, do not try to use TGA.
#]=======================================================================]

find_path(TGA_INCLUDE_DIR
  tga.h
  HINTS
    $ENV{REZ_TGA_ROOT}
  PATH_SUFFIXES
    include
)
mark_as_advanced(TGA_INCLUDE_DIR)


find_library(TGA_LIBRARY
  NAMES
    libtga-lib.a
  HINTS
    $ENV{REZ_TGA_ROOT}
  PATH_SUFFIXES
    lib
  )

mark_as_advanced(TGA_LIBRARY)

if (TGA_LIBRARY AND TGA_INCLUDE_DIR)
    set(TGA_INCLUDE_DIRS ${TGA_INCLUDE_DIR})
    set(TGA_INCLUDE_DIR ${TGA_INCLUDE_DIRS} ) # for backward compatibility
    set(TGA_LIBRARIES ${TGA_LIBRARY})
endif ()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  TGA
  REQUIRED_VARS
    TGA_LIBRARY
    TGA_INCLUDE_DIR
)
