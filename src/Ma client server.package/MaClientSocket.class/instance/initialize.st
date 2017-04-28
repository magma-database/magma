initializing
initialize
	super initialize.
	byteArray := ByteArray new: 1000.
	stat := MaClientStat new.
	preferences := MaClientServerPreferences new