accessing
restoreMode: aBoolean 
	^ self booleanFlags: 
		(aBoolean 
			ifTrue: [ self booleanFlags maBitSet: 1 ]
			ifFalse: [ self booleanFlags maBitClear: 1 ])