expressions
doesNotUnderstand: aMessage 
	| clause |
	clause := MaClause new
		reader: self ;
		attribute: aMessage selector ;
		yourself.
	self expression ifNil: [ self expression: clause ].
	^ clause