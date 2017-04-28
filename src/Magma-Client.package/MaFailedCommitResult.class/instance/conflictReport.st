private
conflictReport
	^ MaFixedWidthReport new
		for: MagmaCommitConflict
		use: self conflictSpec ;
		for: MagmaCommitConflict
		subReportOn: [ : eachConflict | eachConflict comparisons ] ;

		for: MaObjectComparison
		use: self comparisonSpec ;
		for: MaObjectComparison
		subReportOn: [ : eachComparison | eachComparison differences ] ;

		for: Association
		use: self differenceSpec ;
		yourself