event handling
keyStroke: aKeyboardEvent
	self doKeyStroke: aKeyboardEvent.
	self otherPlotsDo: [ : each | each doKeyStroke: aKeyboardEvent ]