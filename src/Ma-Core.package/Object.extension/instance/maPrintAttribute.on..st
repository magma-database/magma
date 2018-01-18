*ma-core
maPrintAttribute: aString on: aStream 
	aString isSymbol
		ifTrue:
			[ self
				maPrintSelector: aString
				on: aStream ]
		ifFalse:
			[ self
				maPrintInstVar: aString
				on: aStream ]