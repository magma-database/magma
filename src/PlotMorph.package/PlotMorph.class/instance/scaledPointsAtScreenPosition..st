event handling
scaledPointsAtScreenPosition: aPoint
	"Answer an OrderedCollection of all the points across all of my Series at the current x-position of the mouse."
	| xPixelOfCanvas |
	xPixelOfCanvas := (aPoint - self topLeft - self borderWidth) x.
	^ self scaledPoints
		at:
			(xPixelOfCanvas - margin x
				min: scaledPoints size
				max: 1)
		ifAbsent: [ Array empty ]