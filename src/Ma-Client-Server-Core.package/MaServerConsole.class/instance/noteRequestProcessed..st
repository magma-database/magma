notifications
noteRequestProcessed: requestObject 
	| time sound |
	time := Time millisecondsSince: lastRequestStart.
	(playAuditorialization and: [ (sound := soundTheme soundFor: requestObject) notNil ]) ifTrue:
		[ soundQueue ifNil: [ soundQueue := QueueSound new play ].
		soundQueue add: (sound copy duration: time / 1000.0) ].
	(self statistics requestProcessingTimeHistoryFor: requestObject) addValue: time.
	self statistics requestProcessingTimeHistory addValue: time