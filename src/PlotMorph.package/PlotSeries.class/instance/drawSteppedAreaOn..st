drawing
drawSteppedAreaOn: aCanvas 
	| areaColor areaPoints lastScaledPoint | 
			areaColor := self areaColor.
			areaPoints := OrderedCollection new.
			lastScaledPoint := nil.
			points
				do: [:each | 
					| scaledPoint | 
					scaledPoint := each scaledPoint.
					lastScaledPoint
						ifNotNil: [areaPoints add: scaledPoint x @ lastScaledPoint y].
					areaPoints add: scaledPoint.
					lastScaledPoint := scaledPoint].
			aCanvas
				drawPolygon: areaPoints
				color: areaColor
				borderWidth: 0
				borderColor: areaColor