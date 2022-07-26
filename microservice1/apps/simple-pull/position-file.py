import urllib.request
import json


response = urllib.request.urlopen('http://api.open-notify.org/iss-now.json')
html = response.read()
print(html)
obj = json.loads(html)
print(obj['timestamp'])
print(obj['iss_position']['latitude'], obj['iss_position']['latitude'])
