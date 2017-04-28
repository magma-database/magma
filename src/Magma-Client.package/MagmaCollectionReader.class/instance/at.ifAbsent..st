accessing
at: anInteger ifAbsent: aBlock 
	^ self 
		primAt: 
			(reversed 
				ifTrue: [ self lastKnownSize - anInteger + 1 ]
				ifFalse: [ anInteger ])
		ifOutOfBounds: aBlock