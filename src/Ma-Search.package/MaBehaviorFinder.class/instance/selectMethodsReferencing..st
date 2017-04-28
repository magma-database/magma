methods
selectMethodsReferencing: variableName 
	"Remove methods whose names don't reference the variable named aString.  variableName may be the name of a global or an inst-var name in a class."
	| allCalls |
	(Smalltalk hasClassNamed: variableName)
		ifTrue:
			[ allCalls := self systemNavigation allCallsOn: (Smalltalk associationAt: variableName).
			self selectMethods:
				[ : each | allCalls includes: each ] ]
		ifFalse:
			[ self selectMethods:
				[ : each | | offset | (offset := each actualClass indexOfInstVarNamed: variableName) > 0 and: [ each compiledMethod readsField: offset ] ] ]