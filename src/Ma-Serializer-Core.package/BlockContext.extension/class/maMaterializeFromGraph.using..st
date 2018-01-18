*ma-serializer-core
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer

	^ (aMaObjectSerializer materializeGraph: aByteArray) asBlockContext