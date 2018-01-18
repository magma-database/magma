drawing
showYFor: aMouseMoveEvent 
	| dataPoint |
	dataPoint := self unscale: aMouseMoveEvent cursorPoint - self topLeft.
	yLabel
		 contents: (self formattedY: dataPoint y) ;
		 position: self topLeft x + self borderWidth + (self drawBounds right + 6) @ (aMouseMoveEvent cursorPoint y - (yLabel height // 2 + 1)).
	yLabel owner == self ifFalse: [ self addMorph: yLabel ]