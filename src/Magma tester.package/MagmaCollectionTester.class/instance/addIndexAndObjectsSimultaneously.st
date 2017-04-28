test add index and objects simultaneously
addIndexAndObjectsSimultaneously
	| c |
	c := MagmaCollection new
		addIndex: (MaKeywordIndex attribute: #last) ;
		yourself.
	(MaFixtureFactory new newPersonNames: 1) do:
		[ : each |
		c add: each ].
	clientSession commit:
		[ clientSession root 
			at: 'testAddIndexAndObjectsSimultaneously'
			put: c ]