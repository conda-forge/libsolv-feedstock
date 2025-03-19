cmake_minimum_required(VERSION 3.20)

project( test-libsolv LANGUAGES C)

add_executable( test-libsolv test.c)

find_path(libsolv_INCLUDE_DIR NAMES solv/pool.h)
target_include_directories(test-libsolv PRIVATE ${libsolv_INCLUDE_DIR})

find_library(libsolv_LIBRARY NAMES "${SOLV_LIB}")
find_library(libsolvext_LIBRARY NAMES "${SOLVEXT_LIB}")
target_link_libraries(test-libsolv PRIVATE ${libsolv_LIBRARY} ${libsolvext_LIBRARY})

enable_testing()
add_test(NAME test-libsolv COMMAND test-libsolv)
