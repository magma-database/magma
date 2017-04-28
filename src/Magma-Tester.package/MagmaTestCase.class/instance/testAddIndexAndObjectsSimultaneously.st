test add index and objects simultaneously
testAddIndexAndObjectsSimultaneously
	"There was a bug once where adding an new index along with new objects would cause the new objects to be indexed twice.  This ensures that remains fixed."
	self 
		remotePerform: #addIndexAndObjectsSimultaneously
		in: 'client1'.
	timeToVerifyRestore := self 
		remotePerform: #verifyAddedCollectionAndIndex
		in: 'client2'