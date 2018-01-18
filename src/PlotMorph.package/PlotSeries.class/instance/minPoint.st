points
minPoint
	^ points
		ifEmpty: [ nil ]
		ifNotEmpty: [ points min ]