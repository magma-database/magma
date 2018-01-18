enumerating
breadthFirstDo: oneArgBlock at: nodeObject 
	self 
		breadthFirstDo: oneArgBlock
		atAll: {nodeObject}
		path: OrderedCollection new