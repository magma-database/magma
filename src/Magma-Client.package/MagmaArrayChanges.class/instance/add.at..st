overriding
add: anObject at: indexInteger 
	maxIndex := maxIndex max: indexInteger.
	self added
		at: indexInteger
		put: anObject