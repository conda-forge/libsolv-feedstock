#!/bin/bash
mkdir -p build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DENABLE_CONDA=ON \
      -DMULTI_SEMANTICS=ON \
      -DENABLE_PCRE2=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_STATIC=ON \
      ${CMAKE_ARGS} \
      ..

make VERBOSE=1 -j${CPU_COUNT}
