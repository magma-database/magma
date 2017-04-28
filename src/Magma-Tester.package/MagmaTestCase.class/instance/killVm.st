test forward recovery
killVm
	self assertNoMagmaCollectionIndexClass.
	MagmaServerPreferences debugRecovery ifTrue: [ self halt: 'About to kill this image' ].
	Smalltalk crashVm