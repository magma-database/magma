building
newSessionFor: userIdString sessionId: aUuid numberOfChallengers: anInteger clientConnection: aMaClientConnection 
	"Answer an Array whose first element is the sessionId, second is the classDefinitionsByteArray, third is the RepositoryDefinition byteArray, fourth is a boolean, true if single-user, false if listening on a port."
	| connection |
	aUuid class = UUID ifFalse: 
		[ MagmaSoftwareError signal: 'sessionId is ' , aUuid printString , ' but must be a UUID.' ].
	userIdString isString ifFalse: 
		[ MagmaSoftwareError signal: 'userId must be a String but is ' , userIdString printString ].
	(userIdString = MagmaRepositoryController systemSessionUserId and: [ transactionLog hasAnyEntries ]) ifTrue: 
		[ MagmaUserError signal: MagmaRepositoryController systemSessionUserId, ' id is reserved.  Please choose a different connection id.' ].
	anInteger isInteger ifFalse: 
		[ MagmaSoftwareError signal: 'numberOfChallengers must be an Integer but is ' , anInteger printString ].
	aMaClientConnection ifNotNil: 
		[ aMaClientConnection class = MaClientConnection ifFalse: 
			[ MagmaSoftwareError signal: 'clientConnection must be a MaClientConnection but is ' , aMaClientConnection printString ] ].
	(transactionLog hasEntryFor: aUuid) 
		ifTrue: 
			[ "Be extra safe for now, only a notification."
			MagmaNotification signal: 'Potential software error:  Client ' , aUuid asString , ' attempted to connect to the same server even though it was already connected.' ]
		ifFalse: 
			[ connection := transactionLog 
				newSessionFor: userIdString
				sessionId: aUuid
				numberOfChallengers: anInteger
				clientConnection: aMaClientConnection.
			sessions 
				at: aUuid
				put: connection ].
	^ (Array new: 4)
		at: 1
			put: self classDefinitionsByteArray ;
		at: 2
			put: self definitionByteArray ;
		at: 3
			put: self commitNumber ;
		at: 4
			put: self restoreMode not ;
		yourself