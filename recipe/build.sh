#!/usr/bin/env bash

set -euo pipefail

cmake -B build/ \
    -G Ninja \
    -D ENABLE_CONDA=ON \
    -D MULTI_SEMANTICS=ON \
    -D DISABLE_SHARED=OFF \
    -D ENABLE_STATIC=ON \
    ${CMAKE_ARGS}
cmake --build build/ --parallel ${CPU_COUNT} --verbose
cmake --install build/
