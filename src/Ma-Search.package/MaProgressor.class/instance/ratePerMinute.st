accessing
ratePerMinute
	| totalMilliseconds |
	^ (totalMilliseconds := self runningTime asMilliSeconds) > 0 
		ifTrue: [ self unitsCompleted * 60000 / totalMilliseconds asFloat roundTo: 1 ]
		ifFalse: [ 0.0 ]