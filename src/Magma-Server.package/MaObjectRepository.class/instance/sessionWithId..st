accessing
sessionWithId: aUuid 
	^ self 
		sessionWithId: aUuid
		ifAbsent: [ MagmaSessionLost signal ]