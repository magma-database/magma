*magma-tester
sortBlock
	^ self isDescending 
		ifTrue: [ self sortIndex descendingSortBlock ]
		ifFalse: [ self sortIndex ascendingSortBlock ]