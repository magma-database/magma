accessing
globalObject
	^ super globalObject ifNil:
		[ aliases do:
			[ : each | (Smalltalk classNamed: each) ifNotNil:
				[ : cls | ^ cls ] ].
		nil ]