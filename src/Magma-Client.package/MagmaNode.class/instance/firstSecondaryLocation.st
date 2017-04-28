accessing
firstSecondaryLocation
	^ locations size > 1 
		ifTrue: [ locations at: 2 ]
		ifFalse: [ nil ]