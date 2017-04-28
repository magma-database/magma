building
mergePath: anOrderedCollection 
	"Adds each object in anOrderedCollection as a new path in
	the receiver.  The first element in anOrderedCollection is the
	main parent, and each subsequent element is a child of the
	previous.  Any parts of the path that need created will be."
	^ self 
		mergePath: anOrderedCollection
		to: nil