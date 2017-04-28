test blocks
verifyMaterializedSortBlock
	| collection |
	clientSession refresh.
	collection := MaObject withAllSubclasses.
	self should: 
		[ "We have to convert each sortedCollection to Array's because BlockContexts do not support equality testing."
		(collection asSortedCollection: self sortBlock) asArray = (collection asSortedCollection: (clientSession root at: 'testBlocks')) asArray ]