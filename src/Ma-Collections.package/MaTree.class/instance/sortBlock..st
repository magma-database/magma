building
sortBlock: aBlock 
	"Specify a two-argument block, aBlock, which describes how children at each level are sorted."
	| newChildren |
	sortBlock := aBlock.
	newChildren := children class new: children size.
	children keysAndValuesDo: 
		[ : eachParent : eachChildren | 
		newChildren 
			at: eachParent
			put: (eachChildren asSortedCollection: sortBlock) ].
	children := newChildren