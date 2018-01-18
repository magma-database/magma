points
maxPoint
	^ points
		ifEmpty: [ nil ]
		ifNotEmpty: [ points max ]