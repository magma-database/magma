*ma-serializer-core
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer

	| classReference |
	classReference := aMaObjectSerializer materializeGraph: aByteArray.
	^ (aMaObjectSerializer classIdManager classDefinitionsForId: classReference id) last
		ensureClassUsing: aMaObjectSerializer