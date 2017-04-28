as yet unclassified
addNewElement: anObject
	| index bucket  |
	index := self keyHash: anObject.
	bucket := array at: index.
	[bucket notNil] whileTrue: [ bucket key == anObject ifTrue: [ ^ false ]. bucket := bucket next ].
	self atIndex: index insertKey: anObject value: nil.
	^ true

