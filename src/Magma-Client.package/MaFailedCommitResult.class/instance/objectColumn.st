private
objectColumn
	^ (MaFixedWidthReportColumn dataAccessBlock:
		[ : aMaObjectComparison | aMaObjectComparison object1 ])
		 headingText: nil ;
		 alignLeft ;
		 width: 120 ;
		 repeatDuplicateValues: true ;
		 yourself