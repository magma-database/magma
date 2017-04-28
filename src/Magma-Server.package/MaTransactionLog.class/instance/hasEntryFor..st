testing
hasEntryFor: sessionUuid 
	self 
		entryFor: sessionUuid
		ifAbsent: [ ^ false ].
	^ true