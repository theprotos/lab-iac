import urllib.request
import json
from flask import Flask, render_template

app = Flask(__name__, template_folder='.')


@app.route('/')
def hello():
    return render_template('index.html')


@app.route("/postion", methods=['GET'])
def getposition():
    response = urllib.request.urlopen('http://api.open-notify.org/iss-now.json')
    html = response.read()
    return json.loads(html)


@app.route("/metrics", methods=['GET'])
def metrics():
    response = urllib.request.urlopen('http://api.open-notify.org/iss-now.json')
    html = response.read()
    json_responce = json.loads(html)
    response = """latitude """ + json_responce['iss_position']['latitude'] + """
longitude """ + json_responce['iss_position']['longitude'] + """
    """
    return response


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081, debug=True)
