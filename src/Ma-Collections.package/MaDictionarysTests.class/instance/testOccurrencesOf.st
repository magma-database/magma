basic tests
testOccurrencesOf
	| dict |
	dict := self newDict
		at: #a put: 1 ;
		at: #b put: 2 ;
		at: #c put: 1 ;
		at: #d put: 3 ;
		at: #z put: nil ;
		 yourself.
	self 
		assert: (dict occurrencesOf: 1) = 2 ;
		assert: (dict occurrencesOf: nil) = 1