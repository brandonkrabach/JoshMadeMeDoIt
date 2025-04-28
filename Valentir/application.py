# This is the application that I have created with AI as an example.

from flask import Flask, request, render_template, redirect, url_for
import os
# ^ These imports are for flask and os modules.

app = Flask(__name__) # This is an object of type Flask.
tasks = [] # This is a list

@app.route('/') # This is the route for the home page.
def TODO():
    return render_template('TODO.html', tasks=tasks)
# ^ This is the function that renders the TODO.html template and passes the tasks list to it.

@app.route('/add', methods=['POST']) # This is the route for adding a task.