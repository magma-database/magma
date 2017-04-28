test concurrency
testConcurrency
	"This tests the ability of Magma to correctly detect a commit conflict when an already-persistent object is added or removed, and another client then changes its indexed values."
	self 
		remotePerform: #initializeIndexedCollectionForConcurrencyTest in: 'client1' ;
		remotePerform: #addObjectsForConcurrencyTest in: 'client2' ;
		remotePerform: #changeAddedObjects in: 'client1' ;
		remotePerform: #verifyFifthElement in: 'client2'