test MagmaHashTable
hashTableKeys
	^  
	{DateAndTime epoch. 
	DateAndTime
		year: 1969
		month: 5
		day: 10
		hour: 11
		minute: 52. 
	DateAndTime
		year: 2924
		month: 12
		day: 29
		hour: 4
		minute: 59.
	"Intentional duplicate."
	DateAndTime
		year: 1969
		month: 5
		day: 10
		hour: 11
		minute: 52 } , 
	((DateAndTime year: 1999 month: 12 day: 31 hour: 23 minute: 59) 
		to: (DateAndTime year: 2010 month: 1 day: 1 hour: 0 minute: 0) 
		by: 22 hours+37 minutes+11 seconds) dateAndTimes shuffled