private
newSessionFor: aMaRepositoryConnectionRequest sessionId: aUuid 
	^ self repository 
		newSessionFor: aMaRepositoryConnectionRequest userId
		sessionId: aUuid
		numberOfChallengers: MagmaRepositoryDefinition defaultMaximumNumberOfChallengers
		clientConnection: aMaRepositoryConnectionRequest clientConnection