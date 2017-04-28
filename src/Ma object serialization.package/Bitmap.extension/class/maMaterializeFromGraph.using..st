*ma object serialization
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer

	| compressedByteArray |
	compressedByteArray := aMaObjectSerializer materializeGraph: aByteArray.
	^ self decompressFromByteArray: compressedByteArray