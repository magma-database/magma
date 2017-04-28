*ma base additions
maPrintAttribute: aSymbol on: aStream

	(self class allInstVarNames includes: aSymbol asString)
		ifTrue:
			[ self
				maPrintInstVar: aSymbol
				on: aStream ]
		ifFalse:
			[ self
				maPrintSelector: aSymbol
				on: aStream ]
