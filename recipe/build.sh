#!/bin/bash

export CXXFLAGS="$CXXFLAGS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS"
export LDFLAGS="$LDFLAGS -Wl,--exclude-libs,ALL"

cmake \
    -DCMAKE_VERBOSE_MAKEFILE=TRUE \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=$PREFIX/lib/cmake/llvm \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DLLVMSPIRV_INCLUDED_IN_LLVM=no \
    -DSPIRV_TRANSLATOR_DIR=$PREFIX \
    -DOPENCL_CLANG_LIBRARY_NAME=opencl_clang \
    -S . \
    -B ./build

cmake --build ./build
cmake --build ./build --target install
