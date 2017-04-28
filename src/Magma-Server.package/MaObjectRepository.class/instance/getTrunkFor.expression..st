client-requests
getTrunkFor: collectionOid expression: aMaTerm 
	| executor |
	executor := MaQueryExecutor 
		collectionManager: (self collectionManagerFor: collectionOid)
		expression: aMaTerm.
	^ executor trunk