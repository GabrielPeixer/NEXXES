#!/usr/bin/python
import json
import os
json_data=open(‘nexxes.json’).read()
try:
data = json.loads(json_data)
except:
os.system(“echo \”json invalid\”|mailx -s \”json validation error\” -r macgarenlive@hotmail.com”)