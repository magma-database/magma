initialize-release
initialize
	super initialize.
	transaction := MaTransaction session: self.
	preferences := MagmaPreferences new.
	guard := Mutex new.
	allowFailover := true.
	oidCount := requiredProgress := 0.
	strongReferences := OrderedCollection new.
	self
		resetProxies ;
		resetLastClean ;
		initializeSerializer ;
		resetTransactionLevel ;
		initializeCache