add / remove
remove: anObject

	changes
		remove: anObject
		at: (indexes collect: [ :each | each indexHashesFor: anObject ]).
	self changed: #removed.
	^ anObject