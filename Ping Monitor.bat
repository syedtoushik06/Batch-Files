@echo off
title Lag Monitor
color 0A

echo.
echo  Monitoring Connection Stability...
echo  (Press CTRL+C to stop)
echo.
echo  Time       |  Status
echo  ---------------------------

:LOOP
:: Pings Google (8.8.8.8) once (-n 1)
:: 'Find' looks for "TTL" which means success
ping 8.8.8.8 -n 1 | find "TTL=" >nul

if %errorlevel%==0 (
    echo  %time%   |  ONLINE  [Connected]
    color 0A
) else (
    echo  %time%   |  OFFLINE [Connection Lost]
    color 0C
    :: Beep sound to alert you
    echo  
)

:: Wait 2 seconds before checking again (timeout)
timeout /t 2 >nul
goto LOOP