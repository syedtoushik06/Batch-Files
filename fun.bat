@echo off
title JARVIS Voice Module
color 0B

:LOOP
cls
echo =================================================
echo   TEXT-TO-SPEECH ENGINE
echo =================================================
echo.
set /p text="Enter text to speak: "

:: Create a temporary VBS file to handle the audio
set "temp_vbs=talk_temp.vbs"
echo Set Sapi = Wscript.CreateObject("SAPI.SpVoice") > "%temp_vbs%"
echo Sapi.Speak "%text%" >> "%temp_vbs%"

:: Run the VBS file
cscript //nologo "%temp_vbs%"

:: Delete the VBS file to clean up
del "%temp_vbs%"

goto LOOP