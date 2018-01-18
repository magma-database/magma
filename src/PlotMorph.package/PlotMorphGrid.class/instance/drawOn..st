drawing
drawOn: aCanvas 
	drawGrid ifTrue:
		[ isDrawn ifFalse:
			[ self drawGridOn: aCanvas.
			isDrawn := true ] ]