*ma object serialization
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer

	^ (aMaObjectSerializer materializeGraph: aByteArray) asBlockContext