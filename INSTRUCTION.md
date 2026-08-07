# Beginner's Guide to Running the Calculator App

This guide assumes you have **never used Python, Git, Visual Studio Code, a terminal, or a virtual environment before**. Follow every step in order and you will have the calculator running.

---

## Table of Contents

1. [Installing Python](#1-installing-python)
2. [Installing Git](#2-installing-git)
3. [Installing Visual Studio Code](#3-installing-visual-studio-code)
4. [Recommended VS Code Extensions](#4-recommended-vs-code-extensions)
5. [Opening the Project](#5-opening-the-project)
6. [Creating a Virtual Environment](#6-creating-a-virtual-environment)
7. [Activating the Virtual Environment](#7-activating-the-virtual-environment)
8. [Installing Dependencies](#8-installing-dependencies)
9. [The .env File](#9-the-env-file)
10. [Running the Application](#10-running-the-application)
11. [Testing the Application](#11-testing-the-application)
12. [Using Every Feature](#12-using-every-feature)
13. [Troubleshooting](#13-troubleshooting)
14. [FAQ](#14-faq)
15. [Common Mistakes](#15-common-mistakes)
16. [Security Recommendations](#16-security-recommendations)
17. [Next Learning Steps](#17-next-learning-steps)

---

## 1. Installing Python

Python is the programming language this app is written in.

1. Go to [https://www.python.org/downloads/](https://www.python.org/downloads/).
2. Click the yellow **Download Python** button (it will detect your operating system automatically).
3. Run the installer you downloaded.
   - **Windows:** On the first installer screen, **check the box "Add python.exe to PATH"** at the bottom before clicking "Install Now". This step is easy to miss and causes most beginner problems.
   - **macOS:** Run the `.pkg` installer and follow the prompts (Continue -> Agree -> Install).
4. When installation finishes, verify it worked:
   - **Windows:** Press `Win`, type `cmd`, press Enter to open Command Prompt, then type:
     ```
     python --version
     ```
   - **macOS:** Open **Terminal** (press `Cmd + Space`, type "Terminal", press Enter), then type:
     ```
     python3 --version
     ```
5. You should see something like `Python 3.12.4`. If you see an error, restart your computer and try again - this refreshes your PATH settings.

## 2. Installing Git

Git lets you download ("clone") and manage the project's code.

1. Go to [https://git-scm.com/downloads](https://git-scm.com/downloads).
2. Download the installer for your operating system.
3. Run the installer and click "Next" through the default options (defaults are fine for beginners).
4. Verify installation by opening your terminal (Command Prompt on Windows, Terminal on macOS) and typing:
   ```
   git --version
   ```
   You should see a version number like `git version 2.45.0`.

## 3. Installing Visual Studio Code

Visual Studio Code (VS Code) is the editor you'll use to view and run the project.

1. Go to [https://code.visualstudio.com/](https://code.visualstudio.com/).
2. Click **Download**.
3. Run the installer with default settings.
4. Open VS Code once installation finishes to confirm it launches correctly.

## 4. Recommended VS Code Extensions

Inside VS Code:

1. Click the **Extensions** icon in the left sidebar (it looks like four squares, one detached).
2. Search for and install:
   - **Python** (by Microsoft) - adds Python language support, debugging, and run buttons.
   - **Pylance** (by Microsoft) - usually installs automatically with the Python extension; improves autocomplete.
3. No restart is normally required, but you can reload VS Code if prompted.

## 5. Opening the Project

If you received the project as a folder (e.g., a `.zip` file):

1. Extract/unzip the folder somewhere easy to find, like your Desktop.
2. In VS Code, go to **File -> Open Folder...** and select the extracted folder.

If you are cloning from GitHub:

1. Open a terminal in the location where you want the project (e.g., Desktop).
2. Run:
   ```
   git clone <your-repository-url>
   ```
3. In VS Code, go to **File -> Open Folder...** and select the newly created project folder.

## 6. Creating a Virtual Environment

A virtual environment is an isolated space that keeps this project's dependencies separate from everything else on your computer. This prevents version conflicts between projects.

1. Open a terminal **inside VS Code**: go to **Terminal -> New Terminal** (or press `` Ctrl+` ``).
2. Make sure the terminal's current folder is your project folder (it should be, by default).
3. Run:
   - **Windows:**
     ```
     python -m venv .venv
     ```
   - **macOS:**
     ```
     python3 -m venv .venv
     ```
4. This creates a new folder named `.venv` inside your project. You only need to do this once per project.

## 7. Activating the Virtual Environment

You must activate the virtual environment every time you open a new terminal to work on this project.

- **Windows (Command Prompt):**
  ```
  .venv\Scripts\activate
  ```
- **Windows (PowerShell):**
  ```
  .venv\Scripts\Activate.ps1
  ```
  If PowerShell blocks the script with a permissions error, run this once first:
  ```
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  ```
- **macOS/Linux:**
  ```
  source .venv/bin/activate
  ```

When activated, you'll see `(.venv)` appear at the start of your terminal line. That confirms it worked.

## 8. Installing Dependencies

With your virtual environment **activated**, install the one required package:

```
pip install customtkinter
```

Wait for the installation to finish - you'll see a "Successfully installed" message.

## 9. The .env File

This particular calculator app **does not use any API keys, passwords, or secrets**, so it does **not** require a `.env` file to run. You can skip this step.

If a future version of this app adds features that need external services (for example, saving calculation history to a cloud account), a `.env.example` file should be added listing the required variable names, and you would copy it to `.env` and fill in your own values. See `PROJECT_REVIEW.md` for more on why this file is normally recommended for GitHub projects, even when currently unused.

## 10. Running the Application

With your virtual environment activated and dependencies installed, run:

```
python Calculator.py
```

(On macOS, use `python3 Calculator.py` if `python` is not recognized.)

A calculator window titled "Calculator" should appear on your screen.

**Easier option:** After completing the steps above once, you can simply double-click:
- `Start App.bat` on Windows
- `Start App (Mac).command` on macOS

These scripts automatically activate the environment, install any missing packages, and launch the app for you.

## 11. Testing the Application

Try these quick checks to confirm everything works:

1. Click `7`, then `+`, then `3`, then `=`. The display should show `10`.
2. Click `C`. The display should reset to `0`.
3. Click `(`, `4`, `+`, `6`, `)`, `*`, `2`, `=`. The display should show `20`.
4. Type an invalid expression, e.g. `5` then `/` then `0` then `=`. The display should show `Error` (division by zero) or a Python-specific error result - this is expected behavior for the current version.

## 12. Using Every Feature

| Button | What it does |
|---|---|
| `0`-`9` | Adds the digit to the current expression |
| `.` | Adds a decimal point |
| `(` `)` | Groups part of an expression, evaluated first |
| `+` `-` `*` `/` | Adds the arithmetic operator to the expression |
| `C` | Clears the current expression and resets the display to `0` |
| `=` | Evaluates the full expression and shows the result |

There is currently no keyboard input support, undo, memory storage, or calculation history - only the on-screen buttons are functional.

## 13. Troubleshooting

**"python is not recognized as an internal or external command" (Windows)**
Python wasn't added to PATH during installation. Reinstall Python and make sure to check "Add python.exe to PATH".

**"command not found: python" (macOS)**
Use `python3` instead of `python` - macOS often only registers `python3`.

**"No module named customtkinter"**
Your virtual environment isn't activated, or the package wasn't installed. Activate the `.venv` (Step 7) and re-run `pip install customtkinter`.

**The calculator window doesn't appear / nothing happens**
Check the terminal for red error text. Copy the exact error message and search for it, or review the Common Mistakes section below.

**PowerShell won't let me activate the virtual environment**
See the `Set-ExecutionPolicy` command in Step 7.

**Double-clicking the `.command` file on macOS does nothing or shows a security warning**
Right-click the file, choose **Open**, then confirm you want to run it. macOS blocks scripts downloaded from the internet by default the first time.

## 14. FAQ

**Do I need to install Python again every time I open the project?**
No - install it once per computer.

**Do I need to create the virtual environment every time?**
No - create it once per project (Step 6). You only need to *activate* it (Step 7) each time you open a new terminal session.

**Can I delete the `.venv` folder?**
Yes, it's safe to delete - it only contains reinstallable packages. You'll need to redo Steps 6-8 if you delete it.

**Will this work on Linux?**
Yes. Follow the macOS terminal commands (`python3`, `source .venv/bin/activate`) - Linux and macOS commands are the same for this project.

**Can I share my `.venv` folder with someone else?**
No - recreate it on each machine instead. It is not portable and should never be uploaded to GitHub (see `.gitignore` recommendation in `PROJECT_REVIEW.md`).

## 15. Common Mistakes

- Forgetting to activate the virtual environment before installing packages or running the app.
- Installing packages **globally** (without activating `.venv` first), which can cause version conflicts with other Python projects.
- Using `python` on macOS when `python3` is required, or vice versa on some Windows setups.
- Committing the `.venv` folder to Git - it's large and unnecessary; it should be excluded via `.gitignore`.
- Typing expressions with mismatched parentheses, which causes the calculator to show `Error`.

## 16. Security Recommendations

- Never share your `.venv` folder, API keys, or any `.env` file publicly (e.g., on GitHub).
- This app currently evaluates typed expressions using Python's `eval()` function. Because input is restricted to the on-screen buttons, this is low-risk in its current form, but `eval()` should never be extended to accept arbitrary external or pasted text without validation - see `PROJECT_REVIEW.md` for a safer alternative.
- Keep Python and your installed packages up to date to receive security fixes: `pip install --upgrade customtkinter`.

## 17. Next Learning Steps

Once you're comfortable running this project, consider learning:

- **Python basics:** variables, functions, loops - [official Python tutorial](https://docs.python.org/3/tutorial/)
- **Tkinter/CustomTkinter:** building more complex GUIs
- **Git basics:** committing, branching, pull requests
- **Writing tests:** the `pytest` framework, to automatically verify your code works
- **Packaging apps:** tools like `pyinstaller` to turn `Calculator.py` into a standalone `.exe` or `.app` that doesn't require Python to be installed
