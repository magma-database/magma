private-reporting
nameColumn
	^ (MaFixedWidthReportColumn dataAccessBlock: [ : eachHistory | eachHistory name ])
		width: 75 ;
		useEllipsisOnTruncate: true ;
		yourself