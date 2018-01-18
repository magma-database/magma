enumerating
pathFrom: someChildObject to: someParentObject do: oneArgBlock 
	"For each node in the tree from someChildObject to someParentObject, inclusive, value oneArgBlock.  The highest level parent (nil) will not be used as an argument to value oneArgBlock."
	| node |
	someParentObject ifNotNil: [ self verifyIncludes: someParentObject ].
	node := someChildObject.
	[ node isNil or: [ node = someParentObject ] ] whileFalse: 
		[ oneArgBlock value: node.
		node := self parentOf: node ]