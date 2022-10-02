import json
import os
from flask import Flask, request, jsonify, render_template
app = Flask(__name__)

@app.route('/')
def hello_world():
    return render_template('index.htm')

@app.route('/send_message', methods=['POST'])
def send_message():
    message = request.form['message']
    print(message)

    return "How old are you?"

if __name__ == '__main__':
    app.run()
