as yet unclassified
testCannotAddBlock
	self should: [self enableWriteBarrier: [2+2]] raise: Error