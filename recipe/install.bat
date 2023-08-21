if "%PKG_NAME:*static=%"=="%PKG_NAME%" (
    cmake --install build_static/ --verbose
    if %errorlevel% NEQ 0 exit /b %errorlevel%
) else (
    cmake --install build/ --verbose
    if %errorlevel% NEQ 0 exit /b %errorlevel%
)
