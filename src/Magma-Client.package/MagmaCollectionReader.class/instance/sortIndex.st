sort
sortIndex
	trunk ifNil: 
		[ expression isClause 
			ifTrue: [ ^ self indexNamed: expression attribute ]
			ifFalse: [ self isNewCollection ifTrue: [ ^ nil ] ].
		trunk := collection getTrunk: expression ].
	^ trunk sortAttribute ifNotNil: [ : attribute | self indexNamed: attribute ]