*ma-core
maPrintAbbreviatedOn: aStream 
	| date |
	(date := self asDate) makeUTC = Date today
		ifTrue:
			[ self asTime
				print24: false
				showSeconds: false
				on: aStream ]
		ifFalse:
			[ aStream
				 maPrint: ((date printFormat: #(2 1 3 $/ 1 2 1 )) copyUpToLast: $/) ;
				 maPrint: $@.
			self asTime
				print24: false
				showSeconds: false
				on: aStream ]