accessing
connectionWithId: aUUID 
	^ self connections
		detect: [ : each | each sessionId = aUUID ]
		ifNone: [ nil ]