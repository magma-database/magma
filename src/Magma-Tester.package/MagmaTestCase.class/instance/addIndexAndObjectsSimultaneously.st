test add index and objects simultaneously
addIndexAndObjectsSimultaneously
	| c |
	c := MagmaCollection new
		addIndex: (MaKeywordIndex attribute: #name) ;
		yourself.
	(MaFixtureFactory new newPersons: 1) do:
		[ : each |
		c add: each ].
	clientSession commit:
		[ clientSession root 
			at: 'testAddIndexAndObjectsSimultaneously'
			put: c ]