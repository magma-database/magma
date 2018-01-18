initialize-release
initialize
	super initialize.
	self
		alignLeft ;
		headingUnderlineCharacter: $- ;
		leftMarginSize: 2 ;
		useEllipsisOnTruncate: false ;
		width: 10 ;
		repeatDuplicateValues: false