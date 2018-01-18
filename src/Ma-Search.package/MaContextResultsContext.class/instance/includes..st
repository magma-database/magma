testing
includes: anObject
	^ resultsByRelevance anySatisfy: [ : each | each includes: anObject ]