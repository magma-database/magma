test transactions
performCommitConflictTest
	self
		remotePerform: #createCommitConflictFixture
			in: 'client2' ;
		remotePerform: #updateThree
			in: 'client1' ;
		remotePerform: #updateThreeAndFour
			in: 'client2' ;
		remotePerform: #commit
			in: 'client1' ;
		remotePerform: #commitAndHandleFailure
			in: 'client2' ;
		remotePerform: #verifyHasClient2Changes
			in: 'client1'