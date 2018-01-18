*ma-core
maAddYears: anInteger 
	"Answer a new date anInteger years after or, if anInteger is negative, before, the receiver."
	^ Date 
		newDay: self dayOfMonth
		month: self monthIndex
		year: self year + anInteger