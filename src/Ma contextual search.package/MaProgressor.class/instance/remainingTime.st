accessing
remainingTime
	"The estimated time remaining for this process."
	| totalMilliseconds |
	^ (self unitsCompleted > 0 and: [ (totalMilliseconds := self runningTime asMilliSeconds) > 0 ]) 
		ifTrue: 
			[ (self unitsRemaining / (self unitsCompleted / totalMilliseconds) max: 0) asInteger milliSeconds ]
		ifFalse: [ 1 hour	"Whatever" ]