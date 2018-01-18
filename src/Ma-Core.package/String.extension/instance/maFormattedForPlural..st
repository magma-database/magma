*ma-core
maFormattedForPlural: aNumber 
	"This is kind of a wing-nut method, but it can save you some
	redundant code if you care to make your programs user message
	plural and singular friendly.  It will add or remove an s based on
	aNumber and whether or not the receiver already ends in s."
	^ aNumber > 0 & (aNumber <= 1) 
		ifTrue: 
			[ "should not end in s"
			(self 
				maEndsWith: 's'
				caseSensitive: true) 
				ifTrue: 
					[ self 
						copyFrom: 1
						to: self size - 1 ]
				ifFalse: [ self ] ]
		ifFalse: 
			[ (self 
				maEndsWith: 's'
				caseSensitive: true) 
				ifTrue: 
					[ "should end in s"
					self ]
				ifFalse: [ self , 's' ] ]