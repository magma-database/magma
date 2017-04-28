accessing
at: anInteger ifAbsent: aBlock 
	resultsByRelevance 
		inject: 0
		into: 
			[ : sum : each | 
			sum + each size >= anInteger ifTrue: [ ^ each at: anInteger - sum ].
			sum + each size ].
	^ aBlock value