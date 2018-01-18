reporting
printReportTo: aWriteStream 
	"Print a report of all my stats to aWriteStream."
	aWriteStream
		maPrint: 'Note:  All times in milliseconds unless otherwise specified.' ;
		cr ;
		cr.
	self reportDefinition 
		write: self historys
		to: aWriteStream