actions
finalizeOids
	objects class isAutoCleaning
		ifTrue: [ objects finalizeValues ]
		ifFalse: [ objects := objects reject: [ : each | each isNil ] ].
	oids finalizeValues: true