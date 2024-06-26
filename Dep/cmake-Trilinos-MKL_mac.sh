#!/bin/bash

TRILINOS_PATH=../Trilinos-trilinos-release-12-18-1

EXTRA_ARGS=$@

rm -f CMakeCache.txt

# Set paths to OpenMP include and library directories
OPENMP_INCLUDE_DIR="/usr/local/include"
OPENMP_LIB_DIR="/usr/local/lib"

# Set CXXFLAGS and CFLAGS to include OpenMP support
CXXFLAGS="$CXXFLAGS -Wno-error=implicit-function-declaration -Xpreprocessor -fopenmp -I$OPENMP_INCLUDE_DIR"
CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Xpreprocessor -fopenmp -I$OPENMP_INCLUDE_DIR"

# Add OpenMP library flags
LDFLAGS="-L$OPENMP_LIB_DIR -lomp"

cmake \
    -D CMAKE_INSTALL_PREFIX:FILEPATH="$SFTPATH" \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS:STRING="$CXXFLAGS" \
    -D CMAKE_C_FLAGS:STRING="$CFLAGS" \
    -D CMAKE_EXE_LINKER_FLAGS:STRING="$LDFLAGS" \
    -D TPL_ENABLE_HWLOC:BOOL=OFF \
    -D Trilinos_HIDE_DEPRECATED_CODE:BOOL=ON \
    -D Trilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON \
    -D Trilinos_ENABLE_THREAD_SAFE:BOOL=ON \
    -D Trilinos_ENABLE_Fortran:BOOL=OFF \
    -D Trilinos_ENABLE_EXAMPLES:BOOL=ON \
    -D Trilinos_ENABLE_TESTS:BOOL=ON \
    -D Trilinos_ENABLE_OpenMP:BOOL=ON \
    -D Trilinos_ENABLE_CXX11:BOOL=ON \
    -D Trilinos_ENABLE_Tpetra:BOOL=ON \
    -D Trilinos_ENABLE_Belos:BOOL=ON \
    -D Trilinos_ENABLE_Ifpack2:BOOL=ON \
    -D Trilinos_ENABLE_Zoltan2:BOOL=ON \
    -D TPL_ENABLE_HWLOC:BOOL=OFF \
    -D TPL_ENABLE_MPI:BOOL=ON \
    -D BUILD_SHARED_LIBS:BOOL=OFF \
    -D TPL_ENABLE_MKL:BOOL=ON \
    -D MKL_INCLUDE_DIRS:STRING="$MKL_INCLUDE_DIRS" \
    -D MKL_LIBRARY_DIRS:FILEPATH="$MKL_LIB_DIRS" \
    -D MKL_LIBRARY_NAMES:STRING="mkl_rt" \
    -D BLAS_LIBRARY_DIRS:FILEPATH="$MKL_LIB_DIRS" \
    -D BLAS_LIBRARY_NAMES:STRING="mkl_rt" \
    -D LAPACK_LIBRARY_DIRS:FILEPATH="$MKL_LIB_DIRS" \
    -D LAPACK_LIBRARY_NAMES:STRING="mkl_rt" \
    $EXTRA_ARGS \
    $TRILINOS_PATH
