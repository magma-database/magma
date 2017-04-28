test MagmaDictionary
testMagmaDictionary
	self
		 testMagmaDictionaryClass: #MagmaDictionary ;
		
		remotePerform: #verifyEnumerationOfMagmaDictionary
		in: 'client1'