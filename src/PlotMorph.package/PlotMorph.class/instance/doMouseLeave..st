event handling
doMouseLeave: anEvent 
	self
		 hideLabels ;
		 hideCrosshair.
	anEvent hand showTemporaryCursor: Cursor normal.
	self metaElementsChanged