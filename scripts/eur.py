#!/usr/bin/python3

import requests
import json

r = requests.get("https://api.exchangeratesapi.io/latest?base=EUR&symbols=NOK")
resp = json.loads(r.text)

print(round(resp["rates"]["NOK"], 3))
