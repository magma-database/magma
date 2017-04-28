test advance
testAdvance
	self
		remotePerform: #initTestAdvance
			in: 'client1' ;
		remotePerform: #referenceObjectToAdvance
			in: 'client2' ;
		remotePerform: #changeObjectToAdvance
			in: 'client1' ;
		remotePerform: #advanceAndVerify
			in: 'client2'