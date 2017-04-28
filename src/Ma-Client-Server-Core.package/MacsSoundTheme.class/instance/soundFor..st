access
soundFor: aMaClientServerRequest 
	^ sounds
		at: aMaClientServerRequest maOriginalClass
		ifAbsent: [ aMaClientServerRequest class defaultSound ]