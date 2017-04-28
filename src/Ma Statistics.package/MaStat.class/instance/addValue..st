accessing
addValue: aMagnitude 
	"This is named addValue: instead of add: to be easier to find senders."
	last := aMagnitude.
	count := count + 1.
	min := min 
		ifNil: [ aMagnitude ]
		ifNotNil: [ min min: aMagnitude ].
	max := max 
		ifNil: [ aMagnitude ]
		ifNotNil: [ max max: aMagnitude ].
	sum := sum 
		ifNil: [ aMagnitude ]
		ifNotNil: [ sum + aMagnitude ].
	^ aMagnitude