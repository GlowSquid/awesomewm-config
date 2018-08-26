#!/usr/bin/python3

import requests
import json

r = requests.get("https://api.exchangeratesapi.io/latest?base=NOK&symbols=PHP")
resp = json.loads(r.text)

print(round(resp["rates"]["PHP"], 3))
