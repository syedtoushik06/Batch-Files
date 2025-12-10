@echo off
setlocal enabledelayedexpansion
title R Project Generator
color 0B

echo =================================================
echo   R DATA SCIENCE ENVIRONMENT SETUP
echo =================================================
echo.

:: 1. Check if VS Code is installed (Command 'code')
where code >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Visual Studio Code not found in PATH.
    echo Please install VS Code and enable "Add to PATH" in the installer.
    pause
    exit
)

:: 2. Check if R is installed
where R >nul 2>nul
if %errorlevel% neq 0 (
    color 0C
    echo [WARNING] R is not detected in your PATH!
    echo You can still create the folder, but code won't run.
    echo.
)

:NAME_PROJECT
set /p projName="Enter Project Name (No spaces recommended): "

if exist "%projName%" (
    echo.
    echo [!] Folder "%projName%" already exists. Try a different name.
    goto NAME_PROJECT
)

echo.
echo   Building Environment...
echo   -----------------------

:: 3. Create Folder Structure
mkdir "%projName%"
cd "%projName%"
mkdir 01_Data
mkdir 02_Scripts
mkdir 03_Plots
mkdir 04_Output

echo   [+] Created Folders (Data, Scripts, Plots, Output)

:: 4. Create the Main R Script with starter code
(
echo # R Project: %projName%
echo # Created: %date%
echo.
echo # Load standard libraries
echo if ^(!require^("tidyverse"^)^) install.packages^("tidyverse"^)
echo library^(tidyverse^)
echo.
echo # Example Plot
echo print^("Environment Ready!"^)
echo plot^(1:10, main="Setup Successful"^)
) > "02_Scripts\main.R"

echo   [+] Created main.R

:: 5. Create .gitignore (Crucial for R)
:: Ignores hidden R history and large data files
(
echo .Rhistory
echo .RData
echo .Rproj.user
echo .Ruserdata
echo 01_Data/*.csv
echo 01_Data/*.xlsx
) > .gitignore

echo   [+] Created .gitignore

:: 6. Create VS Code Settings (Auto-Recommend R Extension)
mkdir .vscode
(
echo {
echo     "recommendations": [
echo         "REditorSupport.r",
echo         "kbroman.kbroman-r-themes"
echo     ]
echo }
) > .vscode\extensions.json

echo   [+] Configured VS Code Recommendations

echo.
echo =================================================
echo   SETUP COMPLETE. LAUNCHING VS CODE...
echo =================================================
echo.

:: Open VS Code in the current folder (".")
code .

:: Open the main script file
code "02_Scripts\main.R"

timeout /t 3 >nul