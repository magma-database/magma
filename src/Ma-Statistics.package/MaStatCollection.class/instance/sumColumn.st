private-reporting
sumColumn
	^ (MaFixedWidthReportColumn dataAccessBlock: [ : aMaHistoricalStat | aMaHistoricalStat sum ])
		headingText: 'sum' ;
		alignRight ;
		width: 10 ;
		repeatDuplicateValues: true ;
		useEllipsisOnTruncate: true ;
		yourself