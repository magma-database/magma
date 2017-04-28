as yet unclassified
checkTree: tree items: count
	| pairArray  |
	pairArray := ((1 to: count) collect: [:i | Array with: i asString with: i]) shuffled.
	self checkTree: tree array: pairArray