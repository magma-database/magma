*ma-core
maPrintAbbreviatedOn: aStream 
	self size > 80
		ifTrue:
			[ | baPrint |
			baPrint := (self
				copyFrom: 1
				to: 50) printString.
			"Strip off closing brace, because we're gonna insert an ellipsis before it."
			baPrint := baPrint
				copyFrom: 1
				to: baPrint size - 1.
			aStream
				 maPrint: baPrint ;
				 maPrint: '...]' ]
		ifFalse: [ aStream maPrint: self ]