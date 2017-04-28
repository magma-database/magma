private-reporting
countColumn
	^ (MaFixedWidthReportColumn dataAccessBlock: [ : aMaHistoricalStat | aMaHistoricalStat count ])
		headingText: 'Count' ;
		alignRight ;
		width: 8 ;
		repeatDuplicateValues: true ;
		useEllipsisOnTruncate: true ;
		yourself