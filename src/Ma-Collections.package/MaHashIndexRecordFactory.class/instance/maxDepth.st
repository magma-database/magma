private
maxDepth
	"A shortcut way of saying, index highestPossibleKey log: index numberOfSlots."
	^ (index keySize / (index numberOfSlots log: 2)) asInteger
