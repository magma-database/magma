test query cancel
verifyQueryRunning: collectionOid 
	| repository collectionManager |
	repository := magmaConsole controller repository.
	collectionManager := repository 
		collectionManagerFor: collectionOid
		ifAbsent: [ nil ].
	self
		assert: collectionManager notNil ;
		assert: collectionManager isLoading