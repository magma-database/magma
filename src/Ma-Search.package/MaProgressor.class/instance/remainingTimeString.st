accessing
remainingTimeString
	"A message describing how long it will take, and when it will be complete."
	^ String streamContents:
		[ : stream | self remainingTime
			ifNil: [ stream maPrint: 'unknown' ]
			ifNotNil:
				[ : rt | stream
					 maPrint: rt ;
					 maPrint: ' remaining until ' ;
					 maPrint: self completionTime ] ]