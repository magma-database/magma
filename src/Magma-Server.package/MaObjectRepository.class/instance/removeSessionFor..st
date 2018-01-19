client-requests
removeSessionFor: sessionId 
	| clientConnection |
	clientConnection := sessions 
		removeKey: sessionId
		ifAbsent: 
			[ "Perhaps the other session suddenly disconnected..?"
			 ].
	clientConnection ifNotNil: 
		[ clientConnection maClientConnection ifNotNil: [ : cc | cc shouldContinue: false ] ].
	transactionLog 
		removeEntryForSessionId: sessionId
		ifAbsent: 
			[ "Perhaps the other session suddenly disconnected..?"
			 ]