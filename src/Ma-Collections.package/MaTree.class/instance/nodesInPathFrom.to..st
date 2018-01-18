accessing
nodesInPathFrom: someChildObject to: someParentObject 
	"Returns a collection of nodes between someChildObject
	and someParentObject."
	| answer |
	answer := OrderedCollection new.
	self 
		pathFrom: someChildObject
		to: someParentObject
		do: [ : each | answer add: each ].
	^ answer