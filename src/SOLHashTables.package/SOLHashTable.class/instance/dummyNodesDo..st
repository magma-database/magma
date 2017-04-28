debugging
dummyNodesDo: aBlock
	"Evaluate aBlock once for each dummy node value."

	self allNodesDo: [ :node | (node dummy) ifTrue: [aBlock value: node]]