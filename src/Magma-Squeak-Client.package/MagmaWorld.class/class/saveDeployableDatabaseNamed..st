actions
saveDeployableDatabaseNamed: aString
	| loc forDb |
	self halt current isInMagma ifTrue: [ 'The current model is already in a Magma database.  This operation only works on new, non-persistent models.  To make a backup copy of this model, contact the database administrator.' ].
	loc := (FileDirectory default / aString / 'model') asMagmaLocalLocation.
	loc directory assureExistence.
	forDb := self current.
	self reset.
	MagmaRepositoryController create: loc root: forDb.
	loc deployExcluding: Array empty