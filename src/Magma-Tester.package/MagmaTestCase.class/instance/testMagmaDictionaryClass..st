test MagmaDictionary
testMagmaDictionaryClass: className
	self
		
		remotePerform: #initializeMagmaDictionary:
		with: className
		in: 'client1' ;
		
		remotePerform: #verifyMagmaDictionaryAccess:
		with: className
		in: 'client2' ;
		
		remotePerform: #verifyMagmaDictionaryUpdates:
		with: className
		in: 'client1'