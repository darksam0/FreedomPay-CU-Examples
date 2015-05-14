import requests,json

# Written by Scott Ross
# Spring 2015
# Demonstrates connecting to freedompay HPP using JSON
# This example is written in Python using the requests library (http://docs.python-requests.org/en/latest/)
# pip requests

freedompay_url = '***********'
storeId = '**********'
terminalId = '*********'
amount = 50.00

body = json.dumps({'StoreId': storeId, 'TerminalId': terminalId, 'TransactionalTotal': amount, 'IsAuthCapture': 'false',
                   'InvoiceItems': [], 'PurchaseItems': []})

headers = {'content-type': 'application/json'}

r = requests.post(freedompay_url, data=body, headers=headers)

print r.content

