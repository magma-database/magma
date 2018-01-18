changed notifications
metaElementsChanged
	"When mouse moves, we only need to update the cross hair, not rebuild the entire plot."
	fullBounds
		ifNil: [ self invalidRect: self outerBounds ]
		ifNotNil: [ self invalidRect: fullBounds ]