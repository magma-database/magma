initializing
initialize
	super initialize.
	requestInterruptGuard := Mutex new.
	preferences := MagmaServerPreferences new.
	self serverStatistics: MagmaServerStatistics new