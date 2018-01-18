accessing
pathTo: anObject 
	"Returns a collection of the objects that are contained in the path to anObject, ordered from the the top of the hierarchy to anObject."
	^ (self pathFrom: anObject) reverse