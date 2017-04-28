private
userIdColumn
	^ (MaFixedWidthReportColumn dataAccessBlock:
		[ : aMagmaCommitConflict | aMagmaCommitConflict connection userId ])
		 headingText: 'userId' ;
		 alignLeft ;
		 width: 50 ;
		 repeatDuplicateValues: true ;
		 useEllipsisOnTruncate: true ;
		 yourself