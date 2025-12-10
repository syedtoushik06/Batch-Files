@echo off
echo ==========================================
echo  GENERATING BATTERY DIAGNOSTICS...
echo ==========================================

:: This runs the hidden Windows power tool
powercfg /batteryreport /output "battery_report.html"

echo.
echo Report generated successfully!
echo Opening report in your browser...

:: This opens the file immediately
start battery_report.html

pause