creation
userId: aString sessionId: sessionUuid maximumNumberOfChallengers: anInteger clientConnection: aMaClientConnection isSystem: aBoolean
	^ self new
		userId: aString ;
		sessionId: sessionUuid ;
		maximumNumberOfChallengers: anInteger ;
		maClientConnection: aMaClientConnection ;
		isSystem: aBoolean ;
		yourself