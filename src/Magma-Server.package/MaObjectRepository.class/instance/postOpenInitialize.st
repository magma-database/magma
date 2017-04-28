initialize-release
postOpenInitialize
	self initializeNextOid.
	recoveryManager := (MaRecoveryManager repository: self)
		open: self repositoryController localLocation ;
		yourself.
	self postOpenInitializeRecoveryManager.
	self registerAsMemoryHog