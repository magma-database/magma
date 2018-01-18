drawing
showXFor: aMouseMoveEvent 
	(self scaledPointsAtScreenPosition: aMouseMoveEvent cursorPoint) ifNotEmpty:
		[ : points | | point |
		point := points anyOne.
		xLabel
			 contents: (self formattedX: point x) ;
			 position: self topLeft x + self borderWidth + point scaledPoint x - (xLabel width // 2 + 1) @ (self topLeft y + self borderWidth + self drawBounds bottom + 6).
		xLabel owner == self ifFalse: [ self addMorph: xLabel ] ]