@echo off
SETLOCAL

:: 1. Check if the virtual environment folder (.venv) exists
if not exist ".venv" (
    echo [INFO] Virtual environment not found. Creating one now...
    python -m venv .venv
) else (
    echo [INFO] Virtual environment found.
)

:: 2. Activate the virtual environment
:: We use 'call' so the script continues running after activation
call .venv\Scripts\activate.bat

:: 3. Upgrade Pip and Install Analytics Packages
:: Added: numpy, pandas, matplotlib, seaborn, scipy, scikit-learn, openpyxl
echo [INFO] Checking for updates and installing Data Analytics libraries...
python -m pip install --upgrade pip
pip install jupyterlab numpy pandas matplotlib seaborn scipy scikit-learn openpyxl

:: 4. Launch Jupyter Lab
echo [INFO] Launching Jupyter Lab...
echo.
echo [SUCCESS] Jupyter Lab is starting. Keep this window open!
jupyter lab

pause
