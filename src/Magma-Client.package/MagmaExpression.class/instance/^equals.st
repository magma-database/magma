comparing
= aMaExpression
	aMaExpression maOriginalClass = self maOriginalClass ifFalse: [ ^ false ].
	^ operator = aMaExpression operator
	and: [ self terms = aMaExpression terms ]