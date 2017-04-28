accessing
lastKnownSize
	^ segment 
		ifNil: [ self size ]
		ifNotNil: [ segment lastKnownSize max: changes maxIndex ]