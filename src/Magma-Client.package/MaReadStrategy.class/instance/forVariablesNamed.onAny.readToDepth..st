building
forVariablesNamed: arrayOfStrings onAny: aClass readToDepth: anInteger 
	arrayOfStrings do:
		[ : each | self
			forVariableNamed: each
			onAny: aClass
			readToDepth: anInteger ]