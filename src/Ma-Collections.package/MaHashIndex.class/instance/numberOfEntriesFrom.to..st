accessing
numberOfEntriesFrom: lowKey to: highKey 
	"Inclusive of lowKey and highKey, if those keys exist.
	If lowKey does not exist, we count from the next higher key.
	If highKey doesn't exist, we count up to the next highestKey."
	^ guard critical: 
		[ | lowest |
		(lowest := self 
			indexOfLowest: lowKey
			exactKey: false) = 0 ifTrue: [ ^ 0 ].
		(self indexOfHighest: highKey) - lowest + 1 ]