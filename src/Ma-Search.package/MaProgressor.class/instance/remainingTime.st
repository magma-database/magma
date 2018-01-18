accessing
remainingTime
	"The estimated time remaining for this process."
	^ (self knowsTaskSize and: [ self unitsCompleted isZero not and: [self runningTime isZero not ] ])
		ifTrue: [ (self unitsRemaining / (self unitsCompleted / self runningTime asMilliSeconds) max: 0) asInteger milliSeconds ]