notifications
noteRequestProcessed: requestObject 
	| time  |
	time := Time millisecondsSince: lastRequestStart.
	(self statistics requestProcessingTimeHistoryFor: requestObject) addValue: time.
	self statistics requestProcessingTimeHistory addValue: time