accessing
size

	^ resultsByRelevance
		inject: 0
		into: [ : sum : each | sum + each size ]