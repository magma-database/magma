private-reporting
endTimeColumn
	^ (MaFixedWidthReportColumn dataAccessBlock: [ : aMaHistoricalStat | aMaHistoricalStat endTime ])
		headingText: 'End Time' ;
		alignLeft ;
		width: DateAndTime now printString size + 4 ;
		repeatDuplicateValues: true ;
		useEllipsisOnTruncate: false ;
		yourself