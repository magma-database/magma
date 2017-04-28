accessing
entryFor: sessionId 
	^ self 
		entryFor: sessionId
		ifAbsent: [ MagmaSessionLost signal ]