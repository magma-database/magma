test querys - persistent result sets
verifyPersistentResultSet
	| secondReader secondMc |
	clientSession abort.
	secondReader := clientSession root at: 'testPersistentResultSet-secondReader'.
	secondMc := secondReader collection.
	self assert: secondReader size = 10.
	self assert: secondMc size = 10.
	self assert: secondReader first = {50}.
	self assert: secondReader last = {41}.