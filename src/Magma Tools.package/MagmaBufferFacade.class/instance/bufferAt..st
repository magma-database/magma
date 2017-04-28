access
bufferAt: anInteger 
	"Answer the buffer I reference at slot anInteger."
	buffer isPointers ifFalse: [ ^ nil ].
	^ MaOidCalculator 
		objectWithOid: anInteger
		ifNone: [ controller bufferAt: anInteger ]