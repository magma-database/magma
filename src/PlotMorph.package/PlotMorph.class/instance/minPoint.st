drawing
minPoint
	cachedMinPoint ifNil:
		[ (limitMinX notNil and: [ limitMinY notNil ])
			ifTrue: [ cachedMinPoint := limitMinX @ limitMinY ]
			ifFalse:
				[ series do:
					[ : eachSeries | eachSeries points do:
						[ : eachPoint | (limitMinX isNil
							or: limitMaxX isNil
							or:
								[ eachPoint x
									between: limitMinX
									and: limitMaxX ]) ifTrue:
							[ cachedMinPoint := cachedMinPoint
								ifNil: [ eachPoint x@eachPoint minY ]
								ifNotNil: [ cachedMinPoint min: (eachPoint x@eachPoint minY) ] ] ] ].
				limitMinX notNil ifTrue: [ cachedMinPoint := limitMinX @ cachedMinPoint minY ].
				limitMinY notNil ifTrue: [ cachedMinPoint := cachedMinPoint x @ limitMinY ] ] ].
	^ cachedMinPoint ifNil: [ 0 @ 0 ]