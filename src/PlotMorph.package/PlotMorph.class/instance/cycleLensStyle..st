event handling
cycleLensStyle: aKeyboardEvent
	lensStyle := self lensStyles atWrap: (self lensStyles indexOf: lensStyle)+1.
	self otherPlotsDo:
		[ : eachOther | eachOther
			 lensStyle: lensStyle ;
			 metaElementsChanged ].
	self metaElementsChanged