private
ensureByteArrayCanHold: anInteger 
	anInteger > MaSerializedGraphBuffer sizeWarningThreshold ifTrue:
		[ MaObjectSerializationWarning signal: 'Serialization sizeWarningThreshold reached.  Proceed to double it.'.
		MaSerializedGraphBuffer doubleSizeWarningThreshold ].
	anInteger > byteArray size ifTrue:
		[ | newByteArray |
		newByteArray := ByteArray new: anInteger.
		newByteArray
			replaceFrom: 1
			to: byteArray size
			with: byteArray
			startingAt: 1.
		byteArray := newByteArray ]