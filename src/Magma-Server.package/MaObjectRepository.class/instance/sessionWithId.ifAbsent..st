accessing
sessionWithId: aUuid ifAbsent: aBlock 
	^ sessions 
		at: aUuid
		ifAbsent: aBlock