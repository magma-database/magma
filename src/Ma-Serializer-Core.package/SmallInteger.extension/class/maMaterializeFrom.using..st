*ma-serializer-core
maMaterializeFrom: aMaByteObjectBuffer using: aMaObjectSerializer

	^MaOidCalculator
		objectWithOid: aMaByteObjectBuffer oid
		ifNone: [ self error: aMaByteObjectBuffer , ' is not a buffer for a SmallInteger.' ]
