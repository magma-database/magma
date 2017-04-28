client side
submit: aMaNetworkTestPlayerRequest

	| result |
	result := link submit: aMaNetworkTestPlayerRequest.
	result maIsException 
		ifTrue: [ result class signal: result messageText ]
		ifFalse: [ ^result ]