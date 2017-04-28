initializing
initialize
	OpenControllers ifNotNil: [ OpenControllers do: [ : each | each close ] ].
	OpenControllers := Set new.
	self initializeControllersGuard.
	Smalltalk
		addToStartUpList: self ;
		addToShutDownList: self.
	Smalltalk 
		addToStartUpList: MaServerSocket
		after: self