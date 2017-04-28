debugging
regularNodesDo: aBlock
	"Evaluate aBlock once for each regular node value."

	self allNodesDo: [ :node | (node dummy) ifFalse: [aBlock value: node]]