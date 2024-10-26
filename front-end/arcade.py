import os
import subprocess
from flask import Flask, render_template_string, redirect


app = Flask(__name__, static_folder="public")

PATH_TO_VENV = os.path.join(os.getcwd(), "vision/venv/bin/activate")
PATH_TO_VIS = os.path.join(os.getcwd(), "vision/main.py")

@app.route("/")
def index():
    return render_template_string(open("front-end/public/index.html").read())

@app.route("/run-dino", methods=["POST"])
def run_exe():
    try:
        command = f"source {PATH_TO_VENV} && python {PATH_TO_VIS} -g Dino &"
        subprocess.run(command, shell=True, check=True)
        return redirect("https://chromedino.com/")
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e}"
    except Exception as e:
        return f"Unexpected error: {str(e)}"


if __name__ == "__main__":
    app.run(debug=True)

