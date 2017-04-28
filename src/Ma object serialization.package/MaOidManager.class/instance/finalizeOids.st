actions
finalizeOids
	objects class isAutoCleaning 
		ifFalse: [ objects := objects reject: [ : each | each isNil ] ]
		ifTrue: [ objects finalizeValues ].
	oids finalizeValues