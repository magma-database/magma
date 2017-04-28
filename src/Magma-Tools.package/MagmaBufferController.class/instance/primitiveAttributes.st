access
primitiveAttributes
	^ primitiveAttributes ifNil: [ primitiveAttributes := session remotePrimitiveAttributes ]