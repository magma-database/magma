accessing
percentComplete
	"Answers a Float between 0.0 and 1.0."
	^ self knowsTaskSize 
		ifTrue: [ unitsCompleted / taskSize asFloat ]
		ifFalse: [ 0.0 ]