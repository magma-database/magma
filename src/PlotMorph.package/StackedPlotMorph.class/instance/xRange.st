private
xRange
	"Answer the necessary range of the xAxis to cover all my plots' data."
	| minX maxX | minX:=maxX:=nil.
	plots do:
		[ : each | minX := minX
			ifNil: [ each minPoint x ]
			ifNotNil: [ minX min: each minPoint x ].
		maxX := maxX
			ifNil: [ each maxPoint x ]
			ifNotNil: [ maxX max: each maxPoint x ] ].
	^ minX to: maxX