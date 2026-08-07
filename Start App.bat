@echo off
setlocal enabledelayedexpansion
title Calculator - Setup and Launch
cd /d "%~dp0"

echo ===============================================================
echo   Calculator App - Windows Launcher (Was made by Oleh Datsyk)
echo ===============================================================
echo.

REM --- Step 1: Check Python is installed ---
echo [1/5] Checking for Python...
where python >nul 2>nul
if errorlevel 1 (
    echo.
    echo ERROR: Python was not found on your system.
    echo Please install Python from https://www.python.org/downloads/
    echo IMPORTANT: During installation, check the box "Add python.exe to PATH".
    echo.
    pause
    exit /b 1
)
for /f "tokens=2" %%v in ('python --version 2^>^&1') do set PYVER=%%v
echo     Found Python %PYVER%
echo.

REM --- Step 2: Create virtual environment if missing ---
echo [2/5] Checking for virtual environment...
if not exist ".venv\Scripts\activate.bat" (
    echo     No virtual environment found. Creating one now...
    python -m venv .venv
    if errorlevel 1 (
        echo.
        echo ERROR: Failed to create the virtual environment.
        pause
        exit /b 1
    )
    echo     Virtual environment created.
) else (
    echo     Virtual environment already exists.
)
echo.

REM --- Step 3: Activate virtual environment ---
echo [3/5] Activating virtual environment...
call ".venv\Scripts\activate.bat"
if errorlevel 1 (
    echo.
    echo ERROR: Failed to activate the virtual environment.
    pause
    exit /b 1
)
echo     Activated.
echo.

REM --- Step 4: Install dependencies ---
echo [4/5] Checking dependencies...
python -c "import customtkinter" >nul 2>nul
if errorlevel 1 (
    echo     Installing missing dependency: customtkinter...
    if exist "requirements.txt" (
        pip install -r requirements.txt
    ) else (
        pip install customtkinter
    )
    if errorlevel 1 (
        echo.
        echo ERROR: Failed to install dependencies. Check your internet connection.
        pause
        exit /b 1
    )
) else (
    echo     All dependencies already installed.
)
echo.

REM --- Step 5: Check for optional .env file ---
if exist ".env.example" (
    if not exist ".env" (
        echo NOTE: A .env.example file was found but no .env file exists.
        echo       Copy .env.example to .env and fill in any required values.
        echo.
    )
)

REM --- Step 6: Launch the application ---
echo [5/5] Launching Calculator...
echo.
python Calculator.py
set APP_EXIT_CODE=%errorlevel%

if not %APP_EXIT_CODE%==0 (
    echo.
    echo ===============================================
    echo   The application closed with an error.
    echo   Error code: %APP_EXIT_CODE%
    echo   Review any messages above for details.
    echo ===============================================
    pause
)

endlocal
