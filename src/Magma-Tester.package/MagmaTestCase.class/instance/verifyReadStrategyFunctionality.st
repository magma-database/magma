test ReadStrategy
verifyReadStrategyFunctionality
	| rs verifier john jane |
	"Test dynamic type-test on server (to go one deeper for spouse)."
	rs := (MaReadStrategy minimumDepth: 0)
		forVariableNamed: 'spouse'
			onAny: MagmaPerson
			readToDepth: 1 ;
		yourself.
	"Test inheritance of deeper depths from superclasses."
	#(#MagmaContact #MagmaRenamedContact ) do: 
		[ : each | 
		(Smalltalk hasClassNamed: each) ifTrue: 
			[ rs 
				forVariableNamed: 'address'
				onAny: (Smalltalk classNamed: each)
				readToDepth: 1 ] ].
	verifier := 
	[ : person | 
	self
		assert: ((person maIsMutatingProxy and: [ person maRealObjectIsReified]) or: [ person maIsMutatingProxy not ]) ;
		assert: (person name maIsMutatingProxy and: [ person name maRealObjectIsReified not ]);
		assert: (person birthday maIsMutatingProxy and: [ person birthday maRealObjectIsReified not ]);
		assert: ((person address maIsMutatingProxy and: [ person address maRealObjectIsReified ]) or: [ person address maIsMutatingProxy not ]) ;
		assert: ((person spouse maIsMutatingProxy and: [ person spouse maRealObjectIsReified ]) or: [ person spouse maIsMutatingProxy not ]) ].
	clientSession readStrategy: rs.
	john := clientSession refresh root at: #testReadStrategy.
	verifier value: john.
	jane := john spouse.
	verifier value: jane.
	clientSession readStrategy: MaReadStrategy new