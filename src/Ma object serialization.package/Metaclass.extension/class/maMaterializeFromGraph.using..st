*ma object serialization
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer

	^ (Class
		maMaterializeFromGraph: aByteArray
		using: aMaObjectSerializer) class