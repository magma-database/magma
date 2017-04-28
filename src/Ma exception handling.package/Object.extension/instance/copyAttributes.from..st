*ma exception handling
copyAttributes: anArray from: sourceObject

	anArray do:
		[ :each |
		self
			instVarNamed: each asString
			put: (sourceObject instVarNamed: each) copy ]