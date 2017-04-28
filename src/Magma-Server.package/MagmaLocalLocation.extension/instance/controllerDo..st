*magma-server-actions
controllerDo: oneArgBlock 
	| controller |
	^ [ controller := MagmaRepositoryController open: self.
	oneArgBlock value: controller ] ensure:
		[ controller ifNotNil: [ controller close ] ]