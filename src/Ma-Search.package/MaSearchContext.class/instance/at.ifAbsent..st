results access
at: anInteger ifAbsent: aBlock 
	"Answer the result at: anInteger, in order of relevance."
	results ifNil: aBlock.
	^ self results 
		at: anInteger
		ifAbsent: aBlock