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
		resetLastClean ;
		initializeSerializer ;
		resetTransactionLevel ;
"		initializeMagmaNotifications ;"
		initializeCache ;
		initializeProxies.
	self id: nil