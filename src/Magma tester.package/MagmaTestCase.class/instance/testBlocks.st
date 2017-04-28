test blocks
testBlocks
	"We will simply use a two-arg sortBlock to test blocks."

	self
		remotePerform: #addSortBlock
		in: 'client1'.
	self
		remotePerform: #verifyMaterializedSortBlock
		in: 'client2'