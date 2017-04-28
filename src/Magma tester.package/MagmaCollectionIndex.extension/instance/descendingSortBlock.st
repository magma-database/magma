*magma tester
descendingSortBlock
	^ [ :a :b | (self indexHashFor: a) > (self indexHashFor: b) ]