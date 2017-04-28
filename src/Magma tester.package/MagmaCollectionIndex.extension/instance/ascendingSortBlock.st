*magma tester
ascendingSortBlock
	^ [ :a :b | (self indexHashFor: a) < (self indexHashFor: b) ]