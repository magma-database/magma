initialization
initialize
	super initialize.
	self notDrawn.
	drawGrid := true.
	xLabels := OrderedCollection new.
	yLabels := OrderedCollection new