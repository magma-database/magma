operators
includesAllOf: aCollection 
	aCollection 
		ifEmpty: 
			[ lowKey := self index lowestPossibleKey.
			highKey := self index highestPossibleKey ]
		ifNotEmpty: 
			[ aCollection size = 1 
				ifTrue: [ self at: aCollection anyOne ]
				ifFalse: 
					[ | expression |
					expression := (MaExpression reader: reader)
						operator: #& ;
						yourself.
					aCollection do: [ : each | expression addTerm: (self copy at: each) ].
					self
						ensureFilteredReader ;
						become: expression ] ]