test objects
testSamples

	self remotePerform: #addSamples in: 'client1'.
	self remotePerform: #verifySamples in: 'client2'