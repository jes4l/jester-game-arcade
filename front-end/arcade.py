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
def run_dino():
    try:
        command = f"source {PATH_TO_VENV} && python {PATH_TO_VIS} -g Dino &"
        subprocess.run(command, shell=True, check=True)
        return redirect("https://chromedino.com/")
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e}"
    except Exception as e:
        return f"Unexpected error: {str(e)}"

@app.route("/run-ghostRunner", methods=["POST"])
def run_ghostRunners():
    try:
        #command = f"chmod +x ./games/ghost_runner.exe && ./games/ghost_runner.exe && python {PATH_TO_VIS} -g ghostRunner &"
        command = f"source {PATH_TO_VENV} && python {PATH_TO_VIS} -g ghostRunner &"
        subprocess.Popen("./games/slgame.exe")
        subprocess.run(command, shell=True, check=True)
        return render_template_string(open("front-end/public/index.html").read())
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e}"
    except Exception as e:
        return f"Unexpected error: {str(e)}"


if __name__ == "__main__":
    app.run(debug=True)

