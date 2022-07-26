from flask import Flask, render_template
import psutil
import time
import json

app = Flask(__name__, template_folder='.')


@app.route('/')
def hello():
    return render_template('index.html')


@app.route('/cpu')
def getcpu():
    responce = """
    {
    "time":""" + str(time.time()) + """,
    "cpu":""" + str(psutil.cpu_percent()) + """
    }
    """
    return json.loads(responce)


@app.route('/mem')
def getmem():
    responce = """
    {
    "time":""" + str(time.time()) + """,
    "cpu":""" + str(psutil.virtual_memory().percent) + """
    }
    """
    return json.loads(responce)


@app.route('/free')
def getfreemem():
    responce = """
    {
    "time":""" + str(time.time()) + """,
    "cpu":""" + str(psutil.virtual_memory().available * 100 / psutil.virtual_memory().total) + """
    }
    """
    return json.loads(responce)


@app.route('/metrics')
def metrics():
    disk = psutil.disk_usage('/')
    response = """# HELP disk_usage_percent Usage of disk in percent (0-100)
# TYPE disk_usage_percent gauge
disk_usage_percent """ + str(disk.percent) + """
# HELP cpu_usage_percent Usage of disk in percent (0-100)
# TYPE cpu_usage_percent gauge
cpu_usage_percent """ + str(psutil.cpu_percent()) + """
# HELP mem_usage_percent Usage of disk in percent (0-100)
# TYPE mem_usage_percent gauge
mem_usage_percent """ + str(psutil.virtual_memory().percent) + """
    """
    return response

@app.route('/text')
def text():
    disk = psutil.disk_usage('/')
    response = """
    # HELP disk_usage_percent Usage of disk in percent (0-100)\n\n
    # TYPE disk_usage_percent gauge\n\n
    disk_usage_percent 
    
    <br>
    
    11
    """
    return response


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)
