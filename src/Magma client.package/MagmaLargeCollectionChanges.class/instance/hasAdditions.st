accessing
hasAdditions

	^(changes includesKey: #added) and: [ self added notEmpty ]
