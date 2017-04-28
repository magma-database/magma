*ma object serialization
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer

	| classReference |
	classReference := aMaObjectSerializer materializeGraph: aByteArray.
	^ (aMaObjectSerializer classIdManager classDefinitionsForId: classReference id) last
		ensureClassUsing: aMaObjectSerializer