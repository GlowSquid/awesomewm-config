#!/usr/bin/python3

import requests
import json

r = requests.get("https://exchangeratesapi.io/api/latest?base=EUR&symbols=NOK")
resp = json.loads(r.text)

print(round(resp["rates"]["NOK"], 3))
