*ma base additions
maPrintAbbreviatedOn: aStream 
	aStream
		 maPrint: self year asString ;
		 maPrint: $- ;
		 maPrint:
			(self monthIndex
				printPaddedWith: $0
				to: 2)