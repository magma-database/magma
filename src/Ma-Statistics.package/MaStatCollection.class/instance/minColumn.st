private-reporting
minColumn
	^ (MaFixedWidthReportColumn dataAccessBlock: [ : aMaHistoricalStat | aMaHistoricalStat min ])
		headingText: 'min' ;
		alignRight ;
		width: 10 ;
		repeatDuplicateValues: true ;
		useEllipsisOnTruncate: true ;
		yourself