accessing
at: anInteger put: anObject

	changes
		add: anObject
		at: anInteger.
	^ anObject