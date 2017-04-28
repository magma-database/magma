*magma-server
openLocal: pathStringOrMagmaLocalLocation 
	| controller |
	controller := MagmaRepositoryController openedOn: pathStringOrMagmaLocalLocation asMagmaLocalLocation.
	controller restoreMode ifFalse: [ controller softBranch ].
	^ self repositoryController: controller