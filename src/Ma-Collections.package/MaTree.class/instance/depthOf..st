accessing
depthOf: anObject 
	"Returns the number of parents anObject has."
	| depth |
	depth := -1.
	self 
		pathFrom: anObject
		to: nil
		do: [ : eachInPath | depth := depth + 1 ].
	^ depth