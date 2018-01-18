*ma-core
maAllSelectorsDo: aBlock

	self selectorsDo: aBlock.
	superclass ifNotNil: [ superclass maAllSelectorsDo: aBlock ]