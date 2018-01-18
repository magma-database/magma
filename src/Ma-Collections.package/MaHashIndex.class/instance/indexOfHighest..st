accessing
indexOfHighest: keyInteger 
	"If keyInteger is present, answer the index of its last occurrence.  Otherwise, answer the index of the next lower key.  If keyInteger is lower than all keys in the receiver, answer 0."
	| lowestIndexOfNextHigherKey |
	^ guard critical: 
		[ keyInteger >= self highestPossibleKey ifTrue: [ ^ self size ].
		lowestIndexOfNextHigherKey := self 
			indexOfLowest: keyInteger + 1
			exactKey: false.
		lowestIndexOfNextHigherKey = 1 ifTrue: [ ^ 0 ].	"lower than all"
		lowestIndexOfNextHigherKey = 0 
			ifTrue: [ self size ]
			ifFalse: [ lowestIndexOfNextHigherKey - 1 max: 1 ] ]