*magma-tester
ascendingSortBlock
	^ [ : a : b | (self indexHashesFor: a) min < (self indexHashesFor: b) min ]