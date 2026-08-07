#!/bin/bash

# Calculator App - macOS Launcher
# Double-click this file to set up and run the app.
# If macOS blocks it the first time, right-click -> Open, then confirm.

cd "$(dirname "$0")" || exit 1

echo "============================================================="
echo "  Calculator App - macOS Launcher (Was made by Oleh Datsyk)"
echo "============================================================="
echo ""

# --- Step 1: Check Python is installed ---
echo "[1/5] Checking for Python..."
if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD="python3"
elif command -v python >/dev/null 2>&1; then
    PYTHON_CMD="python"
else
    echo ""
    echo "ERROR: Python was not found on your system."
    echo "Please install Python from https://www.python.org/downloads/"
    echo ""
    read -n 1 -s -r -p "Press any key to close..."
    exit 1
fi
echo "    Found $($PYTHON_CMD --version)"
echo ""

# --- Step 2: Create virtual environment if missing ---
echo "[2/5] Checking for virtual environment..."
if [ ! -f ".venv/bin/activate" ]; then
    echo "    No virtual environment found. Creating one now..."
    "$PYTHON_CMD" -m venv .venv
    if [ $? -ne 0 ]; then
        echo ""
        echo "ERROR: Failed to create the virtual environment."
        read -n 1 -s -r -p "Press any key to close..."
        exit 1
    fi
    echo "    Virtual environment created."
else
    echo "    Virtual environment already exists."
fi
echo ""

# --- Step 3: Activate virtual environment ---
echo "[3/5] Activating virtual environment..."
# shellcheck disable=SC1091
source ".venv/bin/activate"
if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: Failed to activate the virtual environment."
    read -n 1 -s -r -p "Press any key to close..."
    exit 1
fi
echo "    Activated."
echo ""

# --- Step 4: Install dependencies ---
echo "[4/5] Checking dependencies..."
python -c "import customtkinter" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "    Installing missing dependency: customtkinter..."
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    else
        pip install customtkinter
    fi
    if [ $? -ne 0 ]; then
        echo ""
        echo "ERROR: Failed to install dependencies. Check your internet connection."
        read -n 1 -s -r -p "Press any key to close..."
        exit 1
    fi
else
    echo "    All dependencies already installed."
fi
echo ""

# --- Step 5: Check for optional .env file ---
if [ -f ".env.example" ] && [ ! -f ".env" ]; then
    echo "NOTE: A .env.example file was found but no .env file exists."
    echo "      Copy .env.example to .env and fill in any required values."
    echo ""
fi

# --- Step 6: Launch the application ---
echo "[5/5] Launching Calculator..."
echo ""
python Calculator.py
APP_EXIT_CODE=$?

if [ $APP_EXIT_CODE -ne 0 ]; then
    echo ""
    echo "==============================================="
    echo "  The application closed with an error."
    echo "  Error code: $APP_EXIT_CODE"
    echo "  Review any messages above for details."
    echo "==============================================="
    read -n 1 -s -r -p "Press any key to close..."
fi
