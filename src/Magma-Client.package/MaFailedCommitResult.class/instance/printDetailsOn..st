printing
printDetailsOn: aStream 
	self conflictReport
		write: commitConflicts
		to: aStream