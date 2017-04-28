*ma-serializer-core
maSelectPreMadeObjectBufferFrom: aMaObjectSerializer 
	| cl |
	cl := self class.
	cl isBytes ifTrue: [ ^ aMaObjectSerializer preMadeByteObjectBuffer ].
	(cl isWords and: [ cl isPointers not ]) ifTrue: [ ^ aMaObjectSerializer preMadeVariableWordBuffer ].
	cl maIsLogicallyVariable ifTrue: [ ^ aMaObjectSerializer preMadeVariableObjectBuffer ].
	^ aMaObjectSerializer preMadeFixedObjectBuffer