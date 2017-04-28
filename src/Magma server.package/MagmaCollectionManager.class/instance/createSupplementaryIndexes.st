actions
createSupplementaryIndexes
	| position |
	position := 0.
	collection descriptionsDo:
		[ : each |
		self
			ensureIndex: each
			at: (position := position + 1) ]