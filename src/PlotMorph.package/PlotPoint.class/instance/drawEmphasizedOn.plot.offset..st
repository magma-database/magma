drawing
drawEmphasizedOn: aCanvas plot: aPlotMorph offset: offset
	self
		drawOn: aCanvas
		width: (self width max: 2)
		color: (self width < 2 ifTrue: [self color ] ifFalse: [ self color muchLighter ])
		plot: aPlotMorph
		offset: offset