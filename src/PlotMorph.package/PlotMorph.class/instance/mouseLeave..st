event handling
mouseLeave: anEvent 
	self
		 doMouseLeave: anEvent ;
		 otherPlotsDo:
			[ : each | each doMouseLeave: anEvent ]