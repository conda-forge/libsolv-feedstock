#!/bin/bash
mkdir -p build
cd build

cmake -G "Ninja" \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DENABLE_CONDA=ON \
      -DMULTI_SEMANTICS=ON \
      -DENABLE_PCRE2=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_STATIC=ON \
      ${CMAKE_ARGS} \
      ..

ninja
