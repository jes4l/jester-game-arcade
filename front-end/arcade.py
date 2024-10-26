import os
from flask import Flask, render_template_string, redirect
import subprocess

app = Flask("app")

HTML = '''
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SpoOOOky ArCaDe</title>
    <style>
        body {
            font-family: 'Creepster', sans-serif;
            background-color: #000;
            color: #ff4d4d;
            text-align: center;
            overflow: hidden;
            height: 100vh;
            margin: 0;
        }
        h1 {
            font-size: 3em;
            margin-top: 20%;
        }
        #flashlight-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: radial-gradient(circle 50px at center, transparent 100px, rgba(0, 0, 0, 0.9) 120px);
            pointer-events: none;
            z-index: 9999;
            mix-blend-mode: multiply;
        }

        /* Button styling */
        button {
            font-size: 2em;
            padding: 10px 20px;
            background-color: #ff4d4d;
            border: none;
            color: #fff;
            cursor: pointer;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(255, 77, 77, 0.8);
        }
        button:hover {
            background-color: #ff1a1a;
        }
        @import url('https://fonts.googleapis.com/css2?family=Creepster&display=swap');
    </style>
</head>
<body>
    <h1>🎃 Spooky Dino Game 🎃</h1>
    <form action="/run-python" method="post">
        <button type="submit">BOO!</button>
    </form>
    <div id="flashlight-overlay"></div>
    <script>
        document.addEventListener("mousemove", function(event) {
            const overlay = document.getElementById("flashlight-overlay");
            overlay.style.background = `radial-gradient(circle 100px at ${event.clientX}px ${event.clientY}px, transparent 100px, rgba(0, 0, 0, 0.9) 120px)`;
        });
    </script>
</body>
</html>
'''

PATH_TO_VENV = os.path.join(os.getcwd(), "vision/venv/bin/activate")
PATH_TO_VIS = os.path.join(os.getcwd(), "vision/main.py")

@app.route('/')
def index():
    return render_template_string(HTML)

@app.route('/run-python', methods=['POST'])
def run_exe():
    try:
        command = f"source {PATH_TO_VENV} && python {PATH_TO_VIS} &"
        subprocess.run(command, shell=True, check=True)
        return redirect("https://chromedino.com/")
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e}"
    except Exception as e:
        return f"Unexpected error: {str(e)}"


if __name__ == '__main__':
    app.run(debug=True)

