test blocks
verifyCounterBlock
	clientSession refresh.
	self assert: (clientSession root at: #testCounterBlock) value = 2