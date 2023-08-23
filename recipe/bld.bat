cmake -G "Ninja" ^
    -B build/ ^
    -D ENABLE_CONDA=ON ^
    -D MULTI_SEMANTICS=ON ^
    -D WITHOUT_COOKIEOPEN=ON ^
    -D ENABLE_STATIC=OFF ^
    -D DISABLE_SHARED=OFF ^
    -D CMAKE_MSVC_RUNTIME_LIBRARY="MultiThreadedDLL" ^
    %CMAKE_ARGS%
if errorlevel 1 exit 1

cmake --build build/ --parallel %CPU_COUNT%
if errorlevel 1 exit 1

cmake --install build/
if errorlevel 1 exit 1

cmake -G "Ninja" ^
    -B build_static/ ^
    -D ENABLE_CONDA=ON ^
    -D MULTI_SEMANTICS=ON ^
    -D WITHOUT_COOKIEOPEN=ON ^
    -D ENABLE_STATIC=ON ^
    -D DISABLE_SHARED=ON ^
    -D CMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded" ^
    %CMAKE_ARGS%
if errorlevel 1 exit 1

cmake --build build_static/ --parallel %CPU_COUNT%
if errorlevel 1 exit 1

cmake --install build_static/
if errorlevel 1 exit 1
