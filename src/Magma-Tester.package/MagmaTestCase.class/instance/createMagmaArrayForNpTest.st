test non-persistent integration
createMagmaArrayForNpTest
	| arr |
	arr := MagmaArray new.
	arr at: 5 put: 'five'.
	clientSession commit:
		[ clientSession root 
			at: 'testNpIntegrationForMagmaArrays'
			put: arr ]