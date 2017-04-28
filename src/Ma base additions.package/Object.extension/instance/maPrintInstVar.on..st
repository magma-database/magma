*ma base additions
maPrintInstVar: aSymbol on: aStream

	| value |

	aStream
		cr;
		tab;
		nextPutAll: aSymbol;
		nextPutAll: ' = '.
	value := self instVarNamed: aSymbol asString.
	(value isCollection and: [ value isString not ])
		ifTrue:
			[ value do:
				[ :each |
				aStream
					maPrint: each;
					space ] ]
		ifFalse:
			[ aStream maPrint: value ]
