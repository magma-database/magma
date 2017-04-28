test transactions
performBuildIndexCommitConflictTest
	self
		remotePerform: #initializeBuildIndexCommitConflictTest
			in: 'client1' ;
		remotePerform: #update34990
			in: 'client2' ;
		remotePerform: #addIndexAndVerify
			in: 'client1'