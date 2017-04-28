test MagmaDictionary
verifyMagmaDictBeforeUpdates: aMagmaDictionary
	self assert: aMagmaDictionary size = 301.
	200
		to: 500
		do:
			[ : n | (aMagmaDictionary at: n asWords) = n ].
	self deny: (aMagmaDictionary includesKey: 600)