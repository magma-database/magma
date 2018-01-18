drawing
labelColor
	| baseColor lighter darker |
	baseColor := self baseColor asNontranslucentColor.
	lighter := baseColor twiceLighter twiceLighter twiceLighter.
	darker := baseColor twiceDarker twiceDarker twiceDarker.
	^ (lighter diff: baseColor) > (darker diff: baseColor)
		ifTrue: [ lighter ]
		ifFalse: [ darker ]