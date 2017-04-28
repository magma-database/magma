test querys - persistent result sets
testPersistentResultSet
	"When creating a distinct result-set, we have to create a file on the server.  But that file must have a unique-name, not a transient-oid name, and the user could make it persistent anyway.  Be sure this works."
	self 
		remotePerform: #createInitialIndexedCollection
		in: 'client1'.
	self 
		remotePerform: #createTransientResultSetAndVerify
		in: 'client2'.
	self 
		remotePerform: #verifyPersistentResultSet
		in: 'client1'.
	timeToVerifyRestore := self 
		remotePerform: #noteVerifyPersistentResultSetComplete
		in: 'client2'