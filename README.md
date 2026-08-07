# Calculator

A simple, modern desktop calculator built with Python and [CustomTkinter](https://github.com/TomSchimansky/CustomTkinter). It supports the four basic arithmetic operations plus parentheses, with a clean dark-themed interface.

![Python](https://img.shields.io/badge/python-3.9%2B-blue)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)
![License](https://img.shields.io/badge/license-unspecified-red)

## Features

- Clean, modern dark-mode UI (CustomTkinter)
- Basic operations: addition, subtraction, multiplication, division
- Parentheses support for grouped expressions
- Decimal number support
- Clear (`C`) button to reset the current expression
- Large, easy-to-tap button layout

## Screenshot

*(Add a screenshot of the running app here, e.g. `docs/screenshot.png`)*

## Requirements

- Python 3.9 or later
- [customtkinter](https://pypi.org/project/customtkinter/)

> New to Python, Git, or VS Code? Follow the complete beginner-friendly walkthrough in [`INSTRUCTION.md`](./INSTRUCTION.md) instead - it explains every step from scratch.

## Quick Start

```bash
# 1. Clone the repository
git clone <your-repository-url>
cd <repository-folder>

# 2. Create and activate a virtual environment
python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

# 3. Install dependencies
pip install customtkinter

# 4. Run the app
python Calculator.py
```

Alternatively, on Windows double-click **`Start App.bat`**, or on macOS double-click **`Start App (Mac).command`** - both scripts will set everything up automatically after the first run.

## Usage

1. Launch the app - a calculator window will open.
2. Tap the number and operator buttons to build an expression (e.g. `12 * (3 + 4)`).
3. Press `=` to evaluate the expression.
4. Press `C` to clear the display and start a new calculation.

## Project Structure

```
.
├── Calculator.py # Main application (UI + logic)
├── README.md # This file
├── INSTRUCTION.md # Complete beginner setup & usage guide
├── Start App.bat # Windows one-click launcher
└── Start App (Mac).command # macOS one-click launcher
```

## Known Limitations

- Expressions are evaluated with Python's built-in `eval()`, restricted to the characters produced by the on-screen buttons. See `PROJECT_REVIEW.md` for a full discussion of this design choice and hardening suggestions.
- No calculation history or memory functions yet.
- No automated tests included.

## Contributing

Contributions are welcome. Please open an issue to discuss any significant change before submitting a pull request.

## License

No license file is currently included in this repository. Until one is added, all rights are reserved by the project author. See `PROJECT_REVIEW.md` for a recommendation on choosing an open-source license.
