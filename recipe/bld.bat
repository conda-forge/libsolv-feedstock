set "CFLAGS= -MD"
echo %CFLAGS%

set "CXXFLAGS= -MD"
echo %CXXFLAGS%

mkdir build
cd build

cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_VERBOSE_MAKEFILE=ON ^
      -D ENABLE_CONDA=ON ^
      -D MULTI_SEMANTICS=ON ^
      -D DISABLE_SHARED=OFF ^
      -D WITHOUT_COOKIEOPEN=ON ^
      -D CMAKE_BUILD_TYPE=Release ^
      ..

if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
