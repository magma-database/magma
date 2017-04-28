test refresh
testRefresh
	"client1 creates an Array with an OC, MC, and gets into a transaction.  client2 makes changes to the object, client1 refreshes to get those changes, then commits his own.  Finally, client2 verifies the changes client1 made."
	self
		remotePerform: #setUpTestRefresh
			in: 'client1' ;
		remotePerform: #makeChanges
			in: 'client2' ;
		remotePerform: #refreshViewAndCommit
			in: 'client1' ;
		remotePerform: #verifyTestRefresh
			in: 'client2'