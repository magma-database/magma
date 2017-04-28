as yet unclassified
finalizeOids
	super finalizeOids.
	newObjects class isAutoCleaning 
		ifTrue: [ newObjects finalizeValues ]
		ifFalse: [ newObjects := newObjects reject: [ : each | each isNil ] ]