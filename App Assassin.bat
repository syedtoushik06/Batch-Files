@echo off
color 0A
title Pro Process Killer

:START
cls
echo ========================================================
echo   TASK KILLER (PID MODE)
echo ========================================================
echo.
echo  Type a name to search (e.g. 'code', 'chrome', 'note')
echo.

set /p keyword="Search Query: "

echo.
echo  Scanning...
echo  --------------------------------------------------------
echo  Image Name                     PID      Session Name
echo  --------------------------------------------------------

:: This lists the processes and highlights your search term
:: It displays the "Image Name" (App) and "PID" (The ID Number)
tasklist | findstr /i "%keyword%"

echo  --------------------------------------------------------
echo.
echo  LOOK AT THE LIST ABOVE.
echo  The "PID" is the number in the second column.
echo.
echo  Example:
echo  chrome.exe                     12560    Console
echo  (In this case, the PID is 12560)
echo.

set /p targetpid="Enter the PID number to kill: "

:: Simple check to ensure you typed a number
if "%targetpid%"=="" goto START

echo.
echo  Killing Process ID %targetpid%...
taskkill /F /PID %targetpid%

echo.
pause
goto START