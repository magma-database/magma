private-reporting
maxColumn
	^ (MaFixedWidthReportColumn dataAccessBlock: [ : aMaHistoricalStat | aMaHistoricalStat max ])
		headingText: 'max' ;
		alignRight ;
		width: 10 ;
		repeatDuplicateValues: true ;
		useEllipsisOnTruncate: true ;
		yourself