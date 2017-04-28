test sequence-number generator
testSequenceNumberGenerator
	self 
		remotePerform: #createSequenceNumberGenerator in: 'client2' ;
		remotePerform: #startGeneratingSequenceNumbers in: 'client1' ;
		remotePerform: #startGeneratingSequenceNumbers in: 'client2'.
	(Delay forSeconds: 10) wait.
	self
		remotePerform: #stopGeneratingSequenceNumbers in: 'client1' ;
		remotePerform: #stopGeneratingSequenceNumbers in: 'client2' ;
		verifySequenceNumbers