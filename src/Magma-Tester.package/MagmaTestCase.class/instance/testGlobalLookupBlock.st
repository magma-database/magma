test blocks
testGlobalLookupBlock
	"Test a block that refers to a global."
	self
		remotePerform: #addGlobalLookupBlock
		in: 'client1'.
	self
		remotePerform: #verifyGlobalLookupBlock
		in: 'client2'