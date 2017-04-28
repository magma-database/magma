accessing
unitsRemaining
	^ self knowsTaskSize
		ifTrue: [ self taskSize - self unitsCompleted ]
		ifFalse: [ 1 ]