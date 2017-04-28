building
forVariableNamed: aString onAny: aClass readToDepth: anInteger 
	| depthDict |
	({Dictionary. 
	Set} includes: aClass) ifTrue: [ MagmaUserError signal: 'Set and Dictionary are treated logically by Magma, just use #onAny: ' , aClass name , ' readToDepth:' ].
	self beNew.
	depthDict := depthSpecifications
		maAt: aClass
		ifPresent:
			[ : foundSpec | foundSpec isInteger
				ifTrue:
					[ depthSpecifications
						at: aClass
						put: (self depthDictionaryOfSize: aClass instSize) ]
				ifFalse: [ foundSpec ] ]
		ifAbsent:
			[ depthSpecifications
				at: aClass
				put: (self depthDictionaryOfSize: aClass instSize) ].
	depthDict
		at: aString
		put: anInteger