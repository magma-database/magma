connections
isConnected
	^ socket notNil and: [ socket isConnected and: [ self protocolEstablished ] ]