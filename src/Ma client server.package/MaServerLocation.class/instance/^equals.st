testing
= aMaServerLocation 
	| myAddress otherAddress |
	aMaServerLocation maOriginalClass = self species ifFalse: [ ^ false ].
	myAddress := self hostAddress.
	otherAddress := aMaServerLocation hostAddress.
	(myAddress isNil xor: otherAddress isNil) ifTrue: [ ^ false ].
	^ (myAddress isNil and: [ otherAddress isNil ]) 
		ifTrue: 
			[ "If neither resolvable, we're not gonna get very far anyway, but at least base this answer on something as meaningful as I can, thehost name."
			host = aMaServerLocation host and: [ port = aMaServerLocation port ] ]
		ifFalse: 
			[ port = aMaServerLocation port and: 
				[ myAddress = otherAddress or: [ myAddress maIsLocalHost and: [ otherAddress maIsLocalHost ] ] ] ]