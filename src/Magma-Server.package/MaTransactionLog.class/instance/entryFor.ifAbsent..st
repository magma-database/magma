accessing
entryFor: sessionId ifAbsent: aBlock 
	^ entries 
		detect: [ : each | each sessionId = sessionId ]
		ifNone: aBlock