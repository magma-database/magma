initializing
initializeSession
	session := (MagmaSession repositoryController: self)
		 allowWriteBarrier: false ;
		 readStrategy: self serverReadStrategy ;
		 yourself.
	self initializeServerSerializer