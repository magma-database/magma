accessing
fractionLoaded
	^ self isNewCollection 
		ifTrue: [ 1 ]
		ifFalse: [ session fractionLoaded: self ]