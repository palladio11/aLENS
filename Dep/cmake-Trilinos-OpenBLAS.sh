#!/bin/bash

TRILINOS_PATH=../Trilinos-trilinos-release-12-18-1

EXTRA_ARGS=$@

rm -f CMakeCache.txt

cmake \
    -D CMAKE_INSTALL_PREFIX:FILEPATH="$SFTPATH" \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS:STRING="$CXXFLAGS" \
    -D CMAKE_C_FLAGS:STRING="$CFLAGS" \
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
    -D TPL_ENABLE_MKL:BOOL=OFF \
    -D BLA_STATIC:BOOL=ON \
    -D BLA_VENDOR:STRING="OpenBLAS" \
    -D TPL_BLAS_LIBRARIES:PATH="/usr/lib/x86_64-linux-gnu/libopenblas.so" \
    -D TPL_LAPACK_LIBRARIES:PATH="/usr/lib/x86_64-linux-gnu/libopenblas.so" \
    $EXTRA_ARGS \
    $TRILINOS_PATH
