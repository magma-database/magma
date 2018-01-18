drawing
drawBarOn: aCanvas for: aPlotMorph fillColor: aColor 
	self
		pointsToPlotOn: aPlotMorph
		do:
			[ : point | | scaledPoint barStart corner1 corner2 lowerRight upperLeft |
			scaledPoint := point scaledPoint.
			barStart := aPlotMorph scale:
				(point y positive
					ifTrue: [ point x @ (0 max: aPlotMorph limitMinY) ]
					ifFalse: [ point x @ (0 min: aPlotMorph limitMaxY) ]).
			corner1 := barStart x - (width + 1 // 2) @ barStart y.
			corner2 := barStart x + (width + 1 // 2) @ scaledPoint y.
			upperLeft := corner1 min: corner2.
			lowerRight := corner1 max: corner2.
			aCanvas
				frameAndFillRectangle: (upperLeft corner: lowerRight)
				fillColor: aColor
				borderWidth: 1
				borderColor: aColor ]