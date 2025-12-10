@echo off
setlocal enabledelayedexpansion
title R Top 10 Data Analysis Setup
color 0B

echo =================================================
echo   R PROJECT: TOP 10 DATA PACKAGES (renv)
echo   (Tidyverse, DataTable, Shiny, Plotly, etc.)
echo =================================================
echo.

:: ---------------------------------------------------
:: 1. AUTO-DETECT R
:: ---------------------------------------------------
echo   [1/6] Scanning for R...
set "rPath="
for /d %%D in ("C:\Program Files\R\R-*") do set "rPath=%%D"

if defined rPath (
    set "rExe=!rPath!\bin\x64\R.exe"
    set "jsonPath=!rExe:\=\\!"
    echo         Found: !rPath!
) else (
    echo   [ERROR] R not found. Please install R.
    pause
    exit
)

:: ---------------------------------------------------
:: 2. CREATE PROJECT FOLDER
:: ---------------------------------------------------
echo.
set /p projName="Enter Project Name: "

if not exist "%projName%" mkdir "%projName%"
cd "%projName%"

mkdir Data
mkdir Scripts
mkdir Plots
mkdir .vscode

:: ---------------------------------------------------
:: 3. INITIALIZE VIRTUAL ENVIRONMENT
:: ---------------------------------------------------
echo.
echo   [2/6] Initializing 'renv' (Virtual Environment)...
echo         (This isolates these packages to THIS folder only)

"!rExe!" -e "if (!require('renv')) install.packages('renv', repos='https://cloud.r-project.org'); renv::init(bare=TRUE)"

:: ---------------------------------------------------
:: 4. INSTALL THE TOP 10 PACKAGES
:: ---------------------------------------------------
echo.
echo   [3/6] Downloading & Installing the "Top 10"...
echo         --------------------------------------------------
echo         1. Tidyverse (includes ggplot2, stringr, forcats, lubridate)
echo         2. data.table
echo         3. readxl
echo         4. broom
echo         5. plotly
echo         6. shiny
echo         --------------------------------------------------
echo         WARNING: This takes time (Large Download).
echo         Please wait until this step finishes...
echo.

:: We install the main bundles. Tidyverse includes 6 of your 10 requests.
"!rExe!" -e "renv::install(c('tidyverse', 'data.table', 'readxl', 'broom', 'plotly', 'shiny'))"

echo.
echo   [4/6] Saving environment state (Snapshot)...
"!rExe!" -e "renv::snapshot()"

:: ---------------------------------------------------
:: 5. CONFIGURE VS CODE
:: ---------------------------------------------------
echo   [5/6] Configuring VS Code...

(
echo {
echo     "r.rterm.windows": "!jsonPath!",
echo     "r.bracketedPaste": true,
echo     "r.plot.view": "plotPane",
echo     "r.alwaysUseActiveTerminal": true,
echo     "files.associations": {
echo         "*.r": "r"
echo     }
echo }
) > .vscode\settings.json

:: ---------------------------------------------------
:: 6. STARTER SCRIPT (Demonstrating the Packages)
:: ---------------------------------------------------
echo   [6/6] Creating starter file...

(
echo # ---------------------------------------------------------
echo # TOP 10 PACKAGES LOAD CHECK
echo # ---------------------------------------------------------
echo.
echo # 1. The Core Meta-Package ^(Visuals, Tidy, String, Date, Factors^)
echo library^(tidyverse^) 
echo.
echo # 2. High Performance Data
echo library^(data.table^)
echo.
echo # 3. Excel Import
echo library^(readxl^)
echo.
echo # 4. Model Cleaning
echo library^(broom^)
echo.
echo # 5. Interactive Plots
echo library^(plotly^)
echo.
echo # 6. Web Apps
echo library^(shiny^)
echo.
echo # ---------------------------------------------------------
echo # TEST CODE
echo # ---------------------------------------------------------
echo print^("All packages loaded successfully from 'renv'!"^)
echo.
echo # Test: Create a quick interactive plot
echo plot_ly^(z = ~volcano, type = "surface"^)
) > "Scripts\main.R"

echo.
echo =================================================
echo   DONE!
echo   Your folder now contains a private installation 
echo   of all 10 packages.
echo =================================================
echo.

code .
code "Scripts\main.R"