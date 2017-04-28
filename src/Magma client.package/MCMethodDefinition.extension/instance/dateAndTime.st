*magma client
dateAndTime
	| subStrings |
	subStrings := self timeStamp subStrings.
	^ subStrings size >= 3
		ifTrue:
			[ DateAndTime
				date: subStrings second asDate
				time: subStrings third asTime ]
		ifFalse: [ DateAndTime epoch ]