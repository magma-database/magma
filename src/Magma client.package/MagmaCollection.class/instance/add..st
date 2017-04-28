add / remove
add: anObject

	self validateCanAdd: anObject.
	changes
		add: anObject
		at: (indexes collect: [ :each | each indexHashesFor: anObject ]).
	self changed: #added.
	^ anObject