recovery
filesDo: twoArgBlock

	memberIndex filesDo: 
		[ : each |
		twoArgBlock
			value: each
			value: (self fileIdForIndex: 0) ]