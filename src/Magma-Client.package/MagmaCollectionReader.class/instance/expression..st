expressions
expression: aTerm 
	aTerm ifNotNil: [ aTerm validateUsing: self ].
	expression := aTerm