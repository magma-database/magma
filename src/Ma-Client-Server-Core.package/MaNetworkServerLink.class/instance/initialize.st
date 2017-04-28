initialize-release
initialize
	super initialize.
	self initializeSerializer.
	submitGuard := Mutex new