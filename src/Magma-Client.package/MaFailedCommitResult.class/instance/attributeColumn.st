private
attributeColumn
	^ (MaFixedWidthReportColumn dataAccessBlock:
		[ : anAssociation | anAssociation key ])
		 headingText: nil ;
		 alignLeft ;
		 width: 20 ;
		 repeatDuplicateValues: true ;
		 yourself