results access
at: anInteger 
	^ self 
		at: anInteger
		ifAbsent: [ self errorSubscriptBounds: anInteger ]