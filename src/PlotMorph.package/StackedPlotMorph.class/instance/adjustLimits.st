private
adjustLimits
	"Adjust the x-axis of each of my plots to be able to accomodate all of my plots x-ranges."
	| range |
	(plots isEmpty or:
		[ plots anySatisfy:
			[ : each | each series isEmpty ] ]) ifTrue: [ ^ self ].
	range := self xRange.
	plots do:
		[ : each | range first < each limitMinX ifTrue: [ each limitMinX: range first ].
		range last > each limitMaxX ifTrue: [ each limitMaxX: range last ] ]