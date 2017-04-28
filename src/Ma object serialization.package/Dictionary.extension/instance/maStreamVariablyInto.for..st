*ma object serialization
maStreamVariablyInto: aMaVariableObjectBuffer for: aMaObjectSerializer
	"Put the receivers instance variables into aMaVariableObjectBuffer."

	| index |
	index := 1.
	self keysAndValuesDo:
		[ : eachKey : eachValue |
		[ : obj |
			aMaVariableObjectBuffer
				maInstVarAt: index
				put: (aMaObjectSerializer oidFor: obj).
			index := index + 1 ]
				value: eachKey;
				value: eachValue ].
	"Now take care of additional named variables."
	3 "skip array and tally, they're taken care of logically, above."
		to: self maInstSize
		do:
			[ : namedIndex |
			aMaVariableObjectBuffer
				maInstVarAt: index + namedIndex
				put: (aMaObjectSerializer oidFor: (self instVarAt: namedIndex)) ]