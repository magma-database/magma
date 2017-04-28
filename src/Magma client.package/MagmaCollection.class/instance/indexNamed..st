indexing
indexNamed: attributeSymbol

	^indexes
		detect: [ :each | each attribute = attributeSymbol ]
		ifNone: [ MagmaUserError signal: attributeSymbol , ' is not an indexed attribute' ]