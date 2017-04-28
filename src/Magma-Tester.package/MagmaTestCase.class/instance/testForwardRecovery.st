test forward recovery
testForwardRecovery
	"- kickoff background process in both clients that add strings to their own OrderedCollection.
		root
			'testDisasterRecovery' -> Array (2-elements)
				1->OC1
				2->OC2
	- each client keeps track of how far it is.
	- Delay for a few seconds while they chug.
	- kill the server, wait for shutdown.
	- client error-handling (NetworkError) has ended their add loop.  Last successful string is known in memory.
	- restart server image, recovery will happen automatically
	- wait for server to respond
	- disconnectClients; connectClients
	- clients verify their own OC against in-memory progress."
	"for flushCache of setup"
	"Our socket to communicate with the test-player hosting the server is now invalid, but the auto-retry logic should establish a new one automatically."
	self setUpForwardRecoveryTest.
	"Make sure cache won't flush because we're testing the restoration from the commit-log."
	self 
		remotePerform: #cacheFlushFrequency:
		with: 9999999
		in: 'server'.
	self startClientFloodingProcesses: true.
	"Let them chug for 10 seconds."
	(Delay forMilliseconds: 10000) wait.
	
	[ self 
		remotePerform: #killVm
		in: 'server' ] 
		on: NetworkError
		do: 
			[ : err | 
			"nothing, expected because we're killing the server."
			 ].
	self waitForServerDown: 'server'.
	(Delay forSeconds: 15) wait.	"to give time for clients network timeout to expire."
	self launchPrimaryServerPlayer.
	self 
		remotePerform: #startServer:
		withArguments: {  true  }
		in: 'server'.
	self 
		remotePerform: #assertForwardRecoverySignaled
		in: 'server'.
	self 
		remotePerform: #assertPotentiallyOpenSignaled
		in: 'server'.
	self verifyFloodProgress.
	self suite initiateBackupPrereqsCompleted add: #testForwardRecovery