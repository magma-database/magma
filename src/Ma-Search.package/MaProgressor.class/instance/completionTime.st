accessing
completionTime
	"The estimated time the process will be completed."
	^ self remainingTime ifNotNil:
		[ : rt | DateAndTime now + rt ]