access
associationAt: key ifAbsent: aBlock 
	table
		at: (self hashFor: key)
		do:
			[ : eachAssociation | eachAssociation value key = key ifTrue: [ ^ eachAssociation value ] ].
	^ aBlock value