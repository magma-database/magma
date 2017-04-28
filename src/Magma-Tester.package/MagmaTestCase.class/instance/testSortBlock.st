test blocks
testSortBlock
	"Test a two-argument Block."
	self
		remotePerform: #addSortBlock
		in: 'client1'.
	self
		remotePerform: #verifySortBlock
		in: 'client2'