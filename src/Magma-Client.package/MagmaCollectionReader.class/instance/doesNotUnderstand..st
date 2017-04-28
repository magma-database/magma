expressions
doesNotUnderstand: aMessage 
	| clause |
	clause := MagmaClause new
		reader: self ;
		attribute: aMessage selector ;
		yourself.
	self expression ifNil: [ self expression: clause ].
	^ clause