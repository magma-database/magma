accessing
pathFrom: anObject 
	"Returns a collection of the objects that are contained in the path to anObject ordered from an Object to the top of the hierarchy."
	^ self 
		nodesInPathFrom: anObject
		to: nil