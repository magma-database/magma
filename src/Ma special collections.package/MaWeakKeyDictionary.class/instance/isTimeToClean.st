as yet unclassified
isTimeToClean
	"Due to inefficient finalization, limit the frequency of cleaning."
	^ (Time millisecondsSince: self lastClean) > 30000