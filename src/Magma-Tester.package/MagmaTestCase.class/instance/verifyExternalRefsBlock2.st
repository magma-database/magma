test blocks
verifyExternalRefsBlock2
	| block |
	clientSession refresh.
	block := clientSession root at: #testExternalRefsBlock2.
	self assert: blockTestFixture = { 'hello' }.
	self assert: (block value: { 1. 2. 3 }) = 1.
	self assert: blockTestFixture = { 'hello' }