from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    # Render the template, passing the choice to it
    return render_template('index.html', image='1')

if __name__ == '__main__':
    app.run(debug=True)
