event handling
cycleCrosshairStyle: aKeyboardEvent 
	crosshairStyle := self crosshairStyles atWrap: (self crosshairStyles indexOf: crosshairStyle)+1.
	self otherPlotsDo:
		[ : eachOther | eachOther
			 crosshairStyle: crosshairStyle ;
			 metaElementsChanged ].
	self metaElementsChanged