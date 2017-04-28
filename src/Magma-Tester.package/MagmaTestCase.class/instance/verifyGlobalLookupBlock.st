test blocks
verifyGlobalLookupBlock
	clientSession refresh.
	self assert: (((clientSession root at: #testGlobalLookupBlock) value: #Object) = Object)