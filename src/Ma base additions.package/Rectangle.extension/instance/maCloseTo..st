*ma base additions
maCloseTo: aRectangle 
	^ (aRectangle topLeft maCloseTo: self topLeft) and: [ aRectangle bottomRight maCloseTo: self bottomRight ]