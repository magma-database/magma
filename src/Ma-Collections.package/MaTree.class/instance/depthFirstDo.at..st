enumerating
depthFirstDo: oneArgBlock at: anObject 
	self 
		depthFirstDo: oneArgBlock
		at: anObject
		path: OrderedCollection new