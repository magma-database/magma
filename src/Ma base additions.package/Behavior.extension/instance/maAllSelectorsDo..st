*ma base additions
maAllSelectorsDo: aBlock

	self selectorsDo: aBlock.
	superclass ifNotNil: [ superclass maAllSelectorsDo: aBlock ]