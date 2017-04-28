*ma object serialization
maStreamVariablyInto: aMaVariableBuffer for: aMaObjectSerializer 
	"Put the receivers instance variables (both named and indexed) into aMaVariableObjectBuffer."
	1
		to: self maInstSize
		do:
			[ : index | aMaVariableBuffer
				maInstVarAt: index
				put: (aMaObjectSerializer oidFor: (self instVarAt: index)) ]