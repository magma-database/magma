*ma base additions
maPrintSelector: aSymbol on: aStream

	| value |

	aStream
		cr;
		tab;
		nextPutAll: aSymbol;
		nextPutAll: ' : '.
	value :=
		[ self perform: aSymbol ]
			on: Error
			do: [ :exc | exc return: (exc messageText ifNil: [ 'error' ]) ].
	(value isCollection and: [ value isString not ])
		ifTrue:
			[ value do:
				[ :each |
				aStream
					maPrint: each;
					space ] ]
		ifFalse:
			[ aStream maPrint: value ]