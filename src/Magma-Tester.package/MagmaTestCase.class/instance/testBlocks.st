test blocks
testBlocks
	self
		
		remotePerform: #initializeBlockSamples
		in: 'client1' ;
		
		remotePerform: #verifyBlockSamples
		in: 'client2'