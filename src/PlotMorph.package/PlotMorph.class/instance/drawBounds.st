geometry
drawBounds
	"answer the rectangle inside the morph where the plot is drawn"
	| widestYlabel |
	widestYlabel := stack
		ifNil: [ grid widestYlabel ]
		ifNotNil: [ stack widestYlabel ].
	^ (0 @ 0 rect: self form width - widestYlabel @ self form height) insetBy: margin+6