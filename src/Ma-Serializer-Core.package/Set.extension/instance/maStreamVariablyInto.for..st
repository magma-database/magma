*ma-serializer-core
maStreamVariablyInto: aMaVariableBuffer for: aMaObjectSerializer
	"Put the receivers instance variables into aMaVariableObjectBuffer as they fit."
	| index |
	index := 1.
	self do:
		[ : eachLinkedObject |
		aMaVariableBuffer
			maInstVarAt: index
			put:
				(aMaVariableBuffer 
					numberToStoreFor: eachLinkedObject
					using: aMaObjectSerializer).
		index := index + 1 ].
	Set instSize+1 "skip array and tally, they're taken care of logically, above."
		to: self maInstSize
		do:
			[ : namedIndex |
			aMaVariableBuffer
				maInstVarAt: index+namedIndex
				put: (aMaObjectSerializer oidFor: (self slotAt: namedIndex)) ]