test storing a session
commitReferenceToSession
	clientSession commit:
		[ clientSession root
			at: 'testStoringMagmaSession' 
			put: clientSession ]