test ReadStrategy
setUpReadStrategyTest
	| person spouse |
	person := MagmaPerson new
		name: 'John Doe' ;
		birthday: Date today ;
		address: (MaTestMailingAddress new
				street: '37 W Broadway' ;
				zip: 11011) ;
		yourself.
	spouse := MagmaPerson new
		name: 'Jane Doe' ;
		birthday: Date today - 3 days ;
		address: (MaTestMailingAddress new
				street: '101 Main' ;
				zip: 11011) ;
		yourself.
	person marry: spouse.
	clientSession commit: 
		[ clientSession root 
			at: #testReadStrategy
			put: person ]