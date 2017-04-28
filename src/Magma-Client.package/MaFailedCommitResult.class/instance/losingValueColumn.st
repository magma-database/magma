private
losingValueColumn
	^ (MaFixedWidthReportColumn dataAccessBlock:
		[ : anAssociation | anAssociation value second ])
		 headingText: nil ;
		 alignLeft ;
		 width: 50 ;
		 repeatDuplicateValues: true ;
		 yourself