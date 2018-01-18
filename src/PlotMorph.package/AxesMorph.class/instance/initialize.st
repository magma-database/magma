initialization
initialize
	super initialize.
	self
		 initializeLabels ;
		 color: Color black.
	font := self class defaultFont.
	margin := 16 @ 19.
	form := nil.
	self
		 hResizing: #spaceFill ;
		 vResizing: #spaceFill ;
		 minWidth: 25 ;
		 minHeight: 25 ;
		 borderWidth: 0