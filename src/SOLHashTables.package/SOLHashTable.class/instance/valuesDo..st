enumerating
valuesDo: aBlock
	"Evaluate aBlock once for each of the receiver's values."

	self regularNodesDo: [ :node | aBlock value: node value]