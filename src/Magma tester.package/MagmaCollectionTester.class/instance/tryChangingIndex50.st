test MagmaArray
tryChangingIndex50
	| ma |
	ma := clientSession root at: 'testMagmaArray'.
	1 
		to: 50
		do: 
			[ : n | 
			ma 
				at: n
				put: 'this string should not be persistent!' ].
	self should: 
		[ 
		[ clientSession commit.
		false ] 
			on: MagmaCommitConflictError
			do: 
				[ : err | 
				self should: [ err result commitConflicts size = 1 ].
				self should: 
					[ err result commitConflicts first conflictingConnection userId = 'client1' ].
				self should: [ err result commitConflicts first conflictingObjects size = 1 ].
				self should: 
					[ err result commitConflicts first conflictingObjects anySatisfy: [ : each | each key = ma yourself ] ].
				true ] ]