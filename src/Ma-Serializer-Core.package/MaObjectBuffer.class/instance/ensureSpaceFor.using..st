private
ensureSpaceFor: storageObject using: bpMapClass 
	| totalSize requiredSpace |
	requiredSpace := self 
		physicalSizeFor: storageObject
		using: bpMapClass.
	(totalSize := requiredSpace + self startPos) > MaSerializedGraphBuffer sizeWarningThreshold ifTrue: 
		[ MaObjectSerializationWarning signal: 'Serialization sizeWarningThreshold reached.  Proceed to double it.'.
		MaSerializedGraphBuffer doubleSizeWarningThreshold ].
	totalSize > byteArray size ifTrue: [ self growTo: totalSize * 2 ].
	self physicalSize: requiredSpace