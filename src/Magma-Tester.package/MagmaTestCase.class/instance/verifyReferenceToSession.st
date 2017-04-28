test storing a session
verifyReferenceToSession
	clientSession abort.
	self assert: (clientSession root at: 'testStoringMagmaSession') yourself == clientSession