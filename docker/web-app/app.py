from flask import Flask, render_template
import os
import signal

app = Flask(__name__)

@app.route('/')
def home():
    image = os.getenv('IMAGE', '1')

    # Render the template, passing the choice to it
    return render_template('index.html', image=image)


@app.route('/kill', methods=['GET'])
def kill_server():
    os.kill(os.getpid(), signal.SIGINT)
    return "Server shutting down..."

if __name__ == '__main__':
    app.run(debug=False)
