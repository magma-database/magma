initialization
initialize
	super initialize.
	color := Color gray.
	width := 1.
	drawPoints := true.
	drawLine := true.
	drawArea := false.
	type := #line.
	points := SortedCollection sortBlock: [ : a : b | a x < b x ]