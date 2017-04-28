*ma-serializer-core
maStreamBytesInto: aMaByteObjectBuffer for: aMaObjectSerializer 
	| legacyRepresentation |
	legacyRepresentation := self asLegacyLargeInteger.
	aMaByteObjectBuffer
		replaceFrom: 1
		to: legacyRepresentation digitLength
		with: legacyRepresentation
		startingAt: 1