#!/usr/bin/python3
import json
import requests
import subprocess
import sys

def run_applescript():
  result = subprocess.run(
      ["osascript", "spottop.applescript"], capture_output=True, text=True
  )
  if result.stderr:
      return json.dumps(None)
  else:
      return result.stdout

current_track = run_applescript()
r = requests.post('http://192.168.1.150:8080/json-input', json=json.loads(current_track))
if r.status_code != 200:
    pass

