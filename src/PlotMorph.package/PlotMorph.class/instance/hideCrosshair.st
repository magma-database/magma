drawing
hideCrosshair
	self
		 doHideCrosshair ;
		 otherPlotsDo:
			[ : each | each doHideCrosshair ]