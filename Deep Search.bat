@echo off
title Deep File Hunter
color 0B

:SEARCH
cls
echo =================================================
echo   DEEP FILE SEARCH
echo =================================================
echo.
echo  I will look inside every sub-folder here.
echo  Enter part of the filename (e.g. 'logo' or 'css')
echo.

set /p keyword="Search for: "

echo.
echo  Searching... (This might take a second)
echo  -----------------------------------------------

:: /s = include subdirectories
:: /b = bare format (just the path, no extra info)
:: /i = case insensitive
dir /s /b | findstr /i "%keyword%"

echo  -----------------------------------------------
echo.
echo  If you see nothing above, the file isn't here.
pause
goto SEARCH