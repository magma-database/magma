expressions
connect: aMaTerm operator: aSymbol 
	| expression |
	expression := (MaExpression reader: reader)
		operator: aSymbol ;
		addTerm: self ;
		addTerm: aMaTerm ;
		yourself.
	reader expression: expression.
	^ expression