as yet unclassified
indexHashForIndexObject: aDate

	(aDate respondsTo: #julianDayNumber)
		ifFalse:
			[ MagmaInvalidIndexObject signal: 'Not a valid date.' ].
	^ aDate julianDayNumber