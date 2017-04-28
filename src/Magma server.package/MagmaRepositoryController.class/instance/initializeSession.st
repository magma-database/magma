initializing
initializeSession
	session := MagmaSession repositoryController: self.
	session readStrategy: self serverReadStrategy.
	self initializeServerSerializer