enumerating
keysAndValuesDo: aBlock
	"Evaluate aBlock once for each of the receiver's <regular key, value> pairs, converting the keys back to the original hash keys."

	self regularNodesDo: [ :node | aBlock value: (self hashKey: node key) value: node value]