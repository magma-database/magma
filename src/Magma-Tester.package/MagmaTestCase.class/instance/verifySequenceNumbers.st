test sequence-number generator
verifySequenceNumbers
	| client1Numbers client2Numbers serverCounterValue |
	serverCounterValue := self remotePerform: #getServerCounterValue in: 'client1'.
	client1Numbers := self remotePerform: #getSequenceNumbers in: 'client1'.
	client2Numbers := self remotePerform: #getSequenceNumbers in: 'client2'.
	self assert: (1 to: serverCounterValue by: 1) asArray = ((client1Numbers, client2Numbers) asSortedCollection asArray)