client
connect: aMagmaLocation as: aString 
	self clientSession: aMagmaLocation newSession.
	clientSession connect: (MagmaUser id: aString).
	self assert: clientSession commitNumber > 0