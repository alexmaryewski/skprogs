#
# Toolchain file for
#
# Intel compiler, MKL library
#
# Notes:
#
#  * CMake format: Command line options (e.g. compiler flags) space separated, other kind
#    of lists semicolon separated.
#
#  * Variables containing library search paths are empty by default. The CMAKE_PREFIX_PATH
#    environment variable should be set up correctly, so that CMake can find those libraries
#    automatically. If that is not the case, override those variables to add search paths
#    manually
#


#
# Fortran compiler settings
#
if("${CMAKE_Fortran_COMPILER_ID}" MATCHES "IntelLLVM")
  set(Fortran_FLAGS_RELEASE "-O2"
    CACHE STRING "Fortran compiler flags for Release build")
else()
  set(Fortran_FLAGS_RELEASE "-O2 -ip"
    CACHE STRING "Fortran compiler flags for Release build")
endif()

set(Fortran_FLAGS_RELWITHDEBINFO "-g ${Fortran_FLAGS_RELEASE}"
  CACHE STRING "Fortran compiler flags for Release build")

set(Fortran_FLAGS_DEBUG "-g -warn all -stand f08 -check -diag-error-limit 1 -traceback"
  CACHE STRING "Fortran compiler flags for Debug build")

# Use intrinsic Fortran 2008 erf/erfc functions
set(INTERNAL_ERFC CACHE BOOL 0)


#
# External libraries
#

# NOTE: Libraries with CMake export files (e.g. ELSI and if the HYBRID_CONFIG_METHODS variable
# contains the "Find" method also libNEGF, libMBD, ScalapackFx and MpiFx) are included by searching
# for the export file in the paths defined in the CMAKE_PREFIX_PATH **environment** variable. Make
# sure your CMAKE_PREFIX_PATH variable is set up accordingly.

# LAPACK and BLAS
# (if the BLAS library contains the LAPACK functions, set LAPACK_LIBRARY to "NONE")

# set(BLAS_LIBRARY "mkl_intel_lp64;mkl_sequential;mkl_core" CACHE STRING "BLAS libraries to link")
# set(BLAS_LIBRARY_DIR "$ENV{MKLROOT}/lib/intel64" CACHE STRING
#     "Directories where BLAS libraries can be found")
# set(LAPACK_LIBRARY "mkl_intel_lp64;mkl_sequential;mkl_core" CACHE STRING "LAPACK libraries to link")
# set(LAPACK_LIBRARY_DIR "$ENV{MKLROOT}/lib/intel64" CACHE STRING
#    "Directories where LAPACK libraries can be found")
# set(BLA_VENDOR Intel10_64lp)
