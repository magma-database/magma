drawing
gridColor
	"Make the grid with slightly less contrast than its labels."
	| baseColor lighter darker |
	baseColor := self labelColor asNontranslucentColor.
	lighter := baseColor twiceLighter lighter.
	darker := baseColor twiceDarker darker.
	^ (lighter diff: baseColor) > (darker diff: baseColor)
		ifTrue: [ lighter ]
		ifFalse: [ darker ]