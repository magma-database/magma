test transactions
performPseudoConflictTest
	"Test the servers ability to analyze the nature of a commit conflict so that, if the conflicting object was changed by more than one client to exactly the same structure, no conflict is raised."
	self
		
		remotePerform: #makeSameChangesAsOtherClient
		in: 'client1' ;
		
		remotePerform: #makeSameChangesAsOtherClient
		in: 'client2' ;
		
		remotePerform: #commit
		in: 'client1' ;
		
		remotePerform: #commit
		in: 'client2'