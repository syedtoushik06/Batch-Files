@echo off
title Internet Fixer
echo ==========================================
echo  FLUSHING DNS AND RENEWING IP...
echo ==========================================

ipconfig /flushdns
ipconfig /release
ipconfig /renew

echo.
echo ==========================================
echo  DONE! Internet connection refreshed.
echo ==========================================
pause