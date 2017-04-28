*ma-core
messagePartsWithIndexDo: twoArgBlock 
	| index |
	index := 0.
	self messagePartsDo:
		[ : each | twoArgBlock
			value: each
			value: (index := index + 1) ]