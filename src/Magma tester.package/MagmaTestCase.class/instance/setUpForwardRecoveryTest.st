test forward recovery
setUpForwardRecoveryTest 
	self
		deny: forwardRecoverySignaled ;
		remotePerform: #initializeForwardRecoveryFixture
			in: 'client1'.
	(Delay forSeconds: 6) wait	"for flushCache of setup"