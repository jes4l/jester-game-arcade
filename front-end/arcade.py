import os
from flask import Flask, render_template_string
import subprocess

app = Flask(__name__)

# HTML template with a button to run the executable
html_template = '''
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arcade</title>
</head>
<body>
    <h1>Spooky Dino Game</h1>
    <form action="/run-python" method="post" onsubmit="openGoogle()">
        <button type="submit">BOO!</button>
    </form>
    <script>
        function openGoogle() {
            window.open("https://chromedino.com/", "_blank");
        }
    </script>
</body>
</html>
'''

PATH_TO_VENV = os.path.join(os.getcwd(), "vision/venv/bin/activate")
PATH_TO_VIS = os.path.join(os.getcwd(), "vision/main.py")

@app.route('/')
def index():
    return render_template_string(html_template)

@app.route('/run-python', methods=['POST'])
def run_exe():
    try:
        command = f"source {PATH_TO_VENV} && python {PATH_TO_VIS} &"
        subprocess.run(command, shell=True, check=True)
        return "Python script has been run successfully."
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e}"
    except Exception as e:
        return f"Unexpected error: {str(e)}"


if __name__ == '__main__':
    app.run(debug=True)

