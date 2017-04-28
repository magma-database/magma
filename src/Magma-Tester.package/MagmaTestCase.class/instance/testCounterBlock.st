test blocks
testCounterBlock
	"Test a Block that refers to a temporary in its home method."
	self
		remotePerform: #addCounterBlock
		in: 'client1'.
	self
		remotePerform: #verifyCounterBlock
		in: 'client2'