accessing
results
	^ results ifNil: 
		[ self initializeResults.
		results ]