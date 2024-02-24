from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route("/")
def index():
    number = int(os.environ.get("NUMBER", 1))
    is_happy = os.environ.get("IS_HAPPY", "true").lower() == "true"
    return render_template("index.html", number=number, is_happy=is_happy)

if __name__ == "__main__":
    app.run(debug=True)  # Change to production settings for deployment
