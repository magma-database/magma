methods
addMethodsReferencing: globalName 
	"Add all methods whose names reference aClass."
	(Smalltalk hasClassNamed: globalName) ifFalse: [ ^ self ].
	self addMethods: (self systemNavigation allCallsOn: (Smalltalk associationAt: globalName))