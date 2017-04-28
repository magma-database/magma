private-reporting
historicalStatNameColumn
	^ (MaFixedWidthReportColumn dataAccessBlock: [ : eachHistory | eachHistory name ])
		headingText: 'Name' ;
		width: 40 ;
		useEllipsisOnTruncate: true ;
		repeatDuplicateValues: true ;
		yourself