accessing
ratePerSecond
	| totalMilliseconds |
	^ (totalMilliseconds := self runningTime asMilliSeconds) > 0 
		ifTrue: [ self unitsCompleted * 1000 / totalMilliseconds asFloat roundTo: 0.1 ]
		ifFalse: [ 0.0 ]