private
initialize
	super initialize.
	self initializeSerializer.
	submitGuard := Mutex new