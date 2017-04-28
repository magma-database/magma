private
winningValueColumn
	^ (MaFixedWidthReportColumn dataAccessBlock:
		[ : anAssociation | anAssociation value first ])
		 headingText: nil ;
		 alignLeft ;
		 width: 50 ;
		 repeatDuplicateValues: true ;
		 yourself