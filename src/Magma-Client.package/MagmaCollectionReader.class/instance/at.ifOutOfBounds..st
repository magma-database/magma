accessing
at: anInteger ifOutOfBounds: aBlock
self deprecated: 'Use #at:ifAbsent:'.
	^ self
		primAt: 
			(reversed
				ifTrue: [ self lastKnownSize - anInteger + 1 ]
				ifFalse: [ anInteger ])
		ifOutOfBounds: aBlock