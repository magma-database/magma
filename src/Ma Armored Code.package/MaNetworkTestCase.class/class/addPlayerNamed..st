initializing
addPlayerNamed: aString 
	self 
		addPlayerNamed: aString
		at: (self getHostNameFor: aString)
		port: self getNextPort