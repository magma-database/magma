accessing
trunkSize
	^ clauses inject: 0 into: [ : sum : each | sum + each lastKnownSize ]