*ma-serializer-core
maSelectPreMadeObjectBufferFrom: aMaObjectSerializer 
	| cl |
	self isMethodContext ifTrue: [  ^ aMaObjectSerializer preMadeMethodContextBuffer  ].
	self isCompiledMethod ifTrue: [ ^ aMaObjectSerializer preMadeCompiledMethodBuffer ].
	cl := self class.
	cl isBytes ifTrue: [ ^ aMaObjectSerializer preMadeByteObjectBuffer ].
	(cl isWords and: [ cl isPointers not ]) ifTrue: [ ^ aMaObjectSerializer preMadeVariableWordBuffer ].
	cl maIsLogicallyVariable ifTrue: [ ^ aMaObjectSerializer preMadeVariableObjectBuffer ].
	^ aMaObjectSerializer preMadeFixedObjectBuffer