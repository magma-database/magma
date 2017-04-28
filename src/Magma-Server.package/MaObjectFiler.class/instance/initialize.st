private
initialize

	super initialize.
	preMadeObjectBuffer := MaObjectBuffer new.
	usedByteArrays := (1 to: 8) collect: [ :each | ByteArray new: each ].
	self initializePrimitiveAttributeAddressesMap.
	magmaStatClassIds := Set new