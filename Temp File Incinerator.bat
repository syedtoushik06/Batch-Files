@echo off
color 0C
echo ==========================================
echo  WARNING: INCINERATING JUNK FILES...
echo ==========================================
echo.

:: Deletes files in the Temp folder quietly (/q) and forces it (/f)
del /q /f /s %temp%\*
rd /s /q %temp%
md %temp%

echo.
echo ==========================================
echo  CLEANUP COMPLETE. SPACE RECOVERED.
echo ==========================================
pause