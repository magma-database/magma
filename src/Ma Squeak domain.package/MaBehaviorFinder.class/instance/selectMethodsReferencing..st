methods
selectMethodsReferencing: globalName 
	"Remove methods whose names don't reference the global named aString."
	| allCalls |
	(Smalltalk hasClassNamed: globalName) ifFalse: [ ^ self ].
	allCalls := self systemNavigation allCallsOn: (Smalltalk associationAt: globalName).
	self selectMethods: [ : each | allCalls includes: each ]