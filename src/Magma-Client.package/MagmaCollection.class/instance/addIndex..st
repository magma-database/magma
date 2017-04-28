indexing
addIndex: aMagmaCollectionIndex 
	(self hasIndexNamed: aMagmaCollectionIndex attribute) ifTrue: 
		[ MagmaUserError signal: 'You already have an index on ' , aMagmaCollectionIndex attribute ].
	self isNewCollection ifFalse: [ self lock ].
	indexes add: aMagmaCollectionIndex.
	aMagmaCollectionIndex asDescription in: 
		[ : desc | 
		changes addIndex: desc.
		descriptions add: desc ]