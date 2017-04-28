comparing
= anObject 
	^ (anObject isKindOf: self maOriginalClass) 
		ifFalse: [ self equals: anObject ]
		ifTrue: 
			[ anObject maOriginalClass = self maOriginalClass 
			and: [ attribute = anObject attribute 
			and: [ lowKey = anObject lowKey 
			and: [ highKey = anObject highKey ] ] ] ]