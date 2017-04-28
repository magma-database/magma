private
connect: aMaTerm operator: aSymbol 
	| expression |
	expression := (MagmaExpression reader: reader)
		operator: aSymbol ;
		addTerm: self ;
		addTerm: aMaTerm ;
		yourself.
	reader expression: expression.
	^ expression