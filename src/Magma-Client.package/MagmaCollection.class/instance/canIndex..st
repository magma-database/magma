indexing
canIndex: anObject

	^indexes allSatisfy: [ :each | each canIndex: anObject ]
