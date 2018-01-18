private-reporting
meanColumn
	^ (MaFixedWidthReportColumn dataAccessBlock: [ : aMaHistoricalStat | aMaHistoricalStat mean ])
		headingText: 'mean' ;
		alignRight ;
		width: 10 ;
		repeatDuplicateValues: true ;
		useEllipsisOnTruncate: false ;
		yourself