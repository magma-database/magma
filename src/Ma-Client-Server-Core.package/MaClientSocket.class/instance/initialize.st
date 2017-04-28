initializing
initialize
	super initialize.
	stat := MaClientStat new.
	preferences := MaClientServerPreferences new.
	self resetSequenceNumber