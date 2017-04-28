test blocks
verifyExternalRefsBlock
	| blocks |
	clientSession refresh.
	blocks := clientSession root at: #testExternalRefsBlock.
	self assert: blocks first value = blocks second value