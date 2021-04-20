#!/usr/bin/python3
import json
import requests
import subprocess
import sys

def run_applescript():
  result = subprocess.run(
      ["/usr/bin/osascript", "/Users/akonkol/code/spottop/applescript/spottop.applescript"], capture_output=True, text=True
  )
  if result.stderr:
      return result.stderr
  else:
      return result.stdout

current_track = run_applescript()
r = requests.post('http://192.168.1.150/json-input', json=json.loads(current_track))
if r.status_code != 200:
    print("failed to talk to spotop json-input")
else:
    pass
