debugging
allNodesDo: aBlock
	"Evaluate aBlock once for each node, both regular and dummy."

	| node |
	node := self bucketAt: 0.
	[nil = node] whileFalse:
	    [aBlock value: node.
		node := node next]