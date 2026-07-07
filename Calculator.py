import customtkinter as ctk

# App appearance
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Main window
app = ctk.CTk()
app.title("Calculator")
app.geometry("380x560")
app.resizable(False, False)

expression = ""

# Functions
def add(value):
    global expression
    expression += str(value)
    display.configure(text=expression)


def clear():
    global expression
    expression = ""
    display.configure(text="0")


def calculate():
    global expression
    try:
        result = eval(expression)
        expression = str(result)
        display.configure(text=expression)
    except:
        expression = ""
        display.configure(text="Error")


# Display
display = ctk.CTkLabel(
    app,
    text="0",
    height=100,
    font=("Arial", 40),
    anchor="e"
)
display.pack(fill="x", padx=20, pady=20)


# Calculator buttons
buttons = [
    ["C", "(", ")", "/"],
    ["7", "8", "9", "*"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["0", ".", "="]
]


# Button frame
frame = ctk.CTkFrame(app)
frame.pack(expand=True, fill="both", padx=20, pady=10)


# Create buttons
for r, row in enumerate(buttons):
    col_idx = 0
    
    for value in row:
        if value == "C":
            command = clear
        elif value == "=":
            command = calculate
        else:
            command = lambda v=value: add(v)

        button = ctk.CTkButton(
            frame,
            text=value,
            font=("Arial", 24),
            height=70,
            corner_radius=18,
            command=command
        )

        # Make 0 button larger
        if value == "0":
            button.grid(
                row=r,
                column=col_idx,
                columnspan=2,
                padx=8,
                pady=8,
                sticky="nsew"
            )
            col_idx += 2
        else:
            button.grid(
                row=r,
                column=col_idx,
                padx=8,
                pady=8,
                sticky="nsew"
            )
            col_idx += 1


# Grid sizing
for i in range(5):
    frame.rowconfigure(i, weight=1)

for i in range(4):
    frame.columnconfigure(i, weight=1)


# Start app
app.mainloop()
