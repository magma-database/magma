*ma-core
maUpToIncluding: anObject

	| start end |
	start := position+1.
	end := collection indexOf: anObject startingAt: start ifAbsent: [ 0 ].

	"not present--return rest of the collection"	
	end = 0 ifTrue: [ ^self upToEnd ].

	"skip to the end and return the data passed over"
	position := end.
	^collection copyFrom: start to: end