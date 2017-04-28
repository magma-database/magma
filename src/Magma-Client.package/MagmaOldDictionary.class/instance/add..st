add / remove
add: anAssociation

	self validateCanAdd: anAssociation.
	changes
		add: anAssociation
		at: (indexes collect: [ :each | each indexHashesFor: anAssociation key ]).
	^ anAssociation