
#Used this video to help write this code:  https://www.youtube.com/watch?v=jQjjqEjZK58

from flask import Flask, render_template, request, redirect, url_for
from waitress import serve

app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/TODO')
def todo():
    return render_template('TODO.html')

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080, debug=True)
    # serve (app, host="0.0.0.0", port=8000) // Doesn't work yet (Don't know why waitress isn't detected)