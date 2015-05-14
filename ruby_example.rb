require 'rubygems'
require 'HTTParty'
require 'json'

# Written by Scott Ross
# Spring 2015 
# Demonstrates connecting to FreedomPay HPP using json
# This example is written in ruby with HTTParty and Json

def doWork()

	url = '**********'
	storeId = '*********' # Get this from FreedomPay HPP
	terminalId = '********' # Get this from FreedomPay HPP
	amount = 50.00 # Transaction cost

	res = HTTParty.post(url, :body => {:StoreId => storeId,
					:TerminalId => terminalId,
	    				:TransactionTotal => amount,
					:IsAuthCapture => false, 
					:InvoiceItems => [], 
					:PurchaseItems=> []}.to_json,
				       	:headers=> {'Content-Type'=>'application/json', 'Accept'=> 'application/json'})

	# This is the response from the webservice
	# This contains formatted response from HPP including the URL to redirect your users too and the GUID used to track
	# the transaction 
	puts res.response.body
end

doWork()
