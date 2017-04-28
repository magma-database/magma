private
oidColumn
	^ (MaFixedWidthReportColumn dataAccessBlock:
		[ : aMaObjectComparison | 'oid:  ', aMaObjectComparison object1 magmaOid asString ])
		 headingText: nil ;
		 alignLeft ;
		 width: 20 ;
		 repeatDuplicateValues: false ;
		 yourself