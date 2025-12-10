@echo off
color 0A
title Auto-Deploy to GitHub/Cloudflare

:: ---------------------------------------------------
:: LOGIC CHECK: IS GIT ALREADY SET UP?
:: ---------------------------------------------------
if exist ".git" (
    goto UPDATE_MODE
) else (
    goto SETUP_MODE
)

:: ---------------------------------------------------
:: MODE 1: FIRST TIME SETUP
:: ---------------------------------------------------
:SETUP_MODE
cls
echo ========================================================
echo  NO GIT DETECTED. STARTING FIRST-TIME SETUP...
echo ========================================================
echo.
echo  Step 1: Initializing Git...
git init
git branch -m main

echo.
echo  Step 2: Preparing files...
git add .
git commit -m "Initial Launch"

echo.
echo  Step 3: Connect to GitHub
echo  -------------------------------------------------------
echo  Go to GitHub.com, create a NEW EMPTY REPOSITORY.
echo  Copy the HTTPS link (e.g. https://github.com/user/repo.git)
echo  -------------------------------------------------------
echo.
set /p repoURL="Paste GitHub URL here (Right-Click): "

echo.
echo  Step 4: Linking and Uploading...
git remote add origin %repoURL%
git push -u origin main

echo.
echo  ========================================================
echo   SETUP COMPLETE!
echo   Your code is now on GitHub.
echo   NOW: Go to Cloudflare Dashboard and link this repo.
echo  ========================================================
pause
exit

:: ---------------------------------------------------
:: MODE 2: ROUTINE UPDATE
:: ---------------------------------------------------
:UPDATE_MODE
cls
echo ========================================================
echo  GIT DETECTED. READY TO UPDATE.
echo ========================================================
echo.

echo  Staging changes...
git add .

echo.
set /p commitMsg="What did you change? (Enter comment): "

echo.
echo  Saving snapshot...
git commit -m "%commitMsg%"

echo.
echo  Uploading to Cloud...
git push

echo.
echo  ========================================================
echo   SUCCESS!
echo   Cloudflare detects this push and updates your site.
echo  ========================================================
pause
exit