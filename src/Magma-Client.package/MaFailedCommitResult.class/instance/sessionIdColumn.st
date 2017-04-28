private
sessionIdColumn
	^ (MaFixedWidthReportColumn dataAccessBlock:
		[ : aMagmaCommitConflict | aMagmaCommitConflict connection sessionId ])
		 headingText: 'sessionId' ;
		 alignLeft ;
		 width: UUID new asString size ;
		 repeatDuplicateValues: false ;
		 yourself