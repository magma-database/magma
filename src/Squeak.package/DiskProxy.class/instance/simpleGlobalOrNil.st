accessing
simpleGlobalOrNil
	"Return the object I refer to if it is a simple global in Smalltalk."

	preSelector ifNotNil: [^ nil].
	constructorSelector == #yourself ifFalse: [^ nil].
	^ Smalltalk at: globalObjectName ifAbsent: [nil].
