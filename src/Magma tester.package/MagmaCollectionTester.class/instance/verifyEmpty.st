test querys - persistent empty
verifyEmpty
	| mc |
	clientSession abort.
	mc := clientSession root at: 'testPersistentEmpty'.
	self 
		verifyMc: mc
		against: OrderedCollection new