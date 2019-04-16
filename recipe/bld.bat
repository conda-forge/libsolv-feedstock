mkdir build 
cd build

cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_VERBOSE_MAKEFILE=ON ^
      -D ENABLE_CONDA=ON ^
      -D MULTI_SEMANTICS=ON ^
      -D DISABLE_SHARED=ON ^
      -D WITHOUT_COOKIEOPEN=ON ^
      ..
      
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
