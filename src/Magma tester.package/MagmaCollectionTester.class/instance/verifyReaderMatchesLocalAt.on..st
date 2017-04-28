private
verifyReaderMatchesLocalAt: rootKeyString on: indexAttribute 
	| reader |
	clientSession abort.	"refresh to get all changes."
	reader := (clientSession root at: rootKeyString) where: 
		[ : rdr | 
		rdr 
			read: indexAttribute
			from: '0'
			to: 'zzzzzzzzzzzzzz' ].
	self 
		verifyReader: reader
		matchesElementsOf: (localRoot at: rootKeyString)