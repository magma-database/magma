initialize-release
finalizeOids
	super finalizeOids.
	newOids finalizeValues: true.
	newObjects class isAutoCleaning 
		ifTrue: [ newObjects finalizeValues ]
		ifFalse: [ newObjects := newObjects reject: [ : each | each isNil ] ]