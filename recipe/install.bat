cmake --install build/ --verbose
if %errorlevel% NEQ 0 exit /b %errorlevel%

if "%PKG_NAME:*static=%"=="%PKG_NAME%" (
    REM relying on conda to dedup package
    echo Doing nothing
) else (
    del /q "%LIBRARY_LIB%\*_static.lib"
)
if %errorlevel% NEQ 0 exit /b %errorlevel%
