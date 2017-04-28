test MagmaDictionary
initializeMagmaDictionary: className 
	| d |
	d := (Smalltalk classNamed: className) new.
	200
		to: 500
		do:
			[ : n | d
				at: n asWords
				put: n ].
	self verifyMagmaDictBeforeUpdates: d.
	clientSession commit:
		[ clientSession root
			at: ('test' , className) asSymbol
			put: d ].
	self verifyMagmaDictBeforeUpdates: d