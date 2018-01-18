*ma-serializer-core
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer 
	| nameRef |
	nameRef := aMaObjectSerializer materializeGraph: aByteArray.
	^ self named: nameRef asSymbol