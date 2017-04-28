recovery
flushAggressively
	^ self 
		valueOfAttribute: #flushAggressively
		ifAbsent: [ true ]