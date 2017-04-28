building
removeEntryForSessionId: sessionId ifAbsent: aBlock 
	^ entries 
		maDetect: [ : each | each sessionId = sessionId ]
		ifFound: [ : foundTransactionLogEntry | entries remove: foundTransactionLogEntry ]
		ifNone: aBlock