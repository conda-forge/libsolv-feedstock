#!/usr/bin/env bash

set -euo pipefail

# Working around a bug where dumpsolv RPATH is still pointing to build environment
# during testing.
if [[ "${target_platform}" == linux* ]]; then
    origin='$ORIGIN'
elif [[ "${target_platform}" == osx* ]]; then
    origin='@loader_path'
fi

cmake -B build/ \
    -G Ninja \
    -D CMAKE_INSTALL_RPATH="${origin}/../lib" \
    -D ENABLE_CONDA=ON \
    -D MULTI_SEMANTICS=ON \
    -D DISABLE_SHARED=OFF \
    -D ENABLE_STATIC=ON \
    ${CMAKE_ARGS}
cmake --build build/ --parallel ${CPU_COUNT} --verbose
cmake --install build/
