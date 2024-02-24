from flask import Flask, render_template
import os
import signal

app = Flask(__name__)

@app.route('/')
def home():
    image = os.getenv('IMAGE', '1')

    title = {
        "1":"All good here",
        "2":"All good here",
        "3":"All good here",
        "1-sad":"You have being hacked",
        "2-sad":"You have being hacked",
        "3-sad":"You have being hacked",
    }

    # Render the template, passing the choice to it
    return render_template('index.html', image=image,title="")


@app.route('/kill', methods=['GET'])
def kill_server():
    os.kill(os.getpid(), signal.SIGINT)
    return "Server shutting down..."

if __name__ == '__main__':
    app.run(debug=False)
