drawing
maxPoint
	cachedMaxPoint ifNil:
		[ (limitMaxX notNil and: [ limitMaxY notNil ])
			ifTrue: [ cachedMaxPoint := limitMaxX @ limitMaxY ]
			ifFalse:
				[ series do:
					[ : eachSeries | eachSeries points do:
						[ : eachPoint | (limitMinX isNil or:
							[ limitMaxX isNil or:
								[ eachPoint x
									between: limitMinX
									and: limitMaxX ] ]) ifTrue:
							[ cachedMaxPoint := cachedMaxPoint
								ifNil: [ eachPoint x@eachPoint maxY ]
								ifNotNil: [ cachedMaxPoint max: (eachPoint x@eachPoint maxY) ] ] ] ].
				limitMaxX notNil ifTrue: [ cachedMaxPoint := limitMaxX @ cachedMaxPoint maxY ].
				limitMaxY notNil ifTrue: [ cachedMaxPoint := cachedMaxPoint x @ limitMaxY ] ] ].
	^ cachedMaxPoint ifNil: [ 1 @ 1 ]