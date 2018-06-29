#!/usr/bin/python3

import requests
import json

r = requests.get("https://exchangeratesapi.io/api/latest?base=NOK&symbols=PHP")
resp = json.loads(r.text)

print(round(resp["rates"]["PHP"], 3))
