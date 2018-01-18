initialize
initialize
	super initialize.
	plots := OrderedCollection new.
	self
		 color: (Color gray alpha: 0.7) ;
		 borderWidth: 0 ;
		 layoutInset: 0 ;
		 layoutPolicy: ProportionalLayout new ;
		 listDirection: #topToBottom ;
		 cellInset: 0 ;
"		 hResizing: #spaceFill ;"
		 cellPositioning: #center ;
		 extent: 500@500