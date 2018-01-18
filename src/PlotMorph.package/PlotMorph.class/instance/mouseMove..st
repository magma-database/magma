event handling
mouseMove: anEvent 
	self
		 doMouseMove: anEvent ;
		 otherPlotsDo:
			[ : each | each doMouseMove: anEvent ]