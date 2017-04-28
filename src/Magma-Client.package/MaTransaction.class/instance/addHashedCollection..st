writebarrier
addHashedCollection: aHashedCollection 
	super add: aHashedCollection.
	super add: aHashedCollection array.
	dictionaryArrays
		at: aHashedCollection array
		put: aHashedCollection