building
newSessionFor: userIdString sessionId: aUuid numberOfChallengers: anInteger clientConnection: aMaClientConnection 
	| connection |
	connection := MagmaClientConnection 
		userId: userIdString
		sessionId: aUuid
		maximumNumberOfChallengers: anInteger
		clientConnection: aMaClientConnection
		isSystem: entries isEmpty.
	entries add: (MaTransactionLogEntry 
			id: aUuid
			connection: connection).
	aMaClientConnection ifNotNil: [ aMaClientConnection info: userIdString , ' - ' , aUuid asString ].
	^ connection