operators
includesAllPrefixes: aCollection 
	"A special purpose operator for MaKeywordIndexes.  Same as includesAllOf: except allows keywords to be searched by aCollection of specified *prefixes* instead of requiring the client to guess entire keywords exactly."
	aCollection 
		ifEmpty: 
			[ lowKey := self index lowestPossibleKey.
			highKey := self index highestPossibleKey ]
		ifNotEmpty: 
			[ aCollection size = 1 
				ifTrue: 
					[ self 
						from: aCollection anyOne
						to: aCollection anyOne maAlphabeticalNext ]
				ifFalse: 
					[ | expression |
					expression := (MaExpression reader: reader)
						operator: #& ;
						yourself.
					aCollection do: 
						[ : eachString | 
						expression addTerm: (self copy 
								from: eachString
								to: eachString maAlphabeticalNext) ].
					self
						ensureFilteredReader ;
						become: expression ] ]