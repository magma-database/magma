building
mergePath: anOrderedCollection to: parentObject 
	"Adds each object in anOrderedCollection as a new path in the receiver.  The first element in anOrderedCollection is added as a child of parentObject, and each subsequent element is a child of the previous.  Whereever part of the path already exists, it is reused."
	parentObject ifNotNil: [ self verifyIncludes: parentObject ].
	anOrderedCollection 
		inject: parentObject
		into: 
			[ : parent : each | 
			self 
				add: each
				asChildOf: parent.
			each ].
	^ anOrderedCollection