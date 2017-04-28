*magma-server
process
	^ self repository 
		registerAndLoad: commitPackage 
		using: expression
		from: sourceCollectionOid
		forSession: sessionId
		distinct: distinct