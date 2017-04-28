operators
includesAnyOf: aCollection 
	aCollection 
		ifEmpty: 
			[ "Must always answer false to match Collection behavior."
			self beAlwaysFalse ]
		ifNotEmpty: 
			[ aCollection size = 1 
				ifTrue: [ self at: aCollection anyOne ]
				ifFalse: 
					[ | expression |
					expression := (MaExpression reader: reader)
						operator: #| ;
						yourself.
					aCollection do: [ : each | expression addTerm: (self copy at: each) ].
					self
						ensureFilteredReader ;
						become: expression ] ]