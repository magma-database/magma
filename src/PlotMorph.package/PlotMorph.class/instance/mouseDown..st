event handling
mouseDown: anEvent 
	self
		 deselectAll ;
		 hideCrosshair.
	anEvent hand showTemporaryCursor: Cursor normal