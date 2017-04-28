accessing
controllerOpenedOn: aMagmaLocalLocation 
	"Answer the RepositoryController already opened on aMagmaLocalLocation.  If no existing controller is already open, answer nil."
	^ self controllersGuard: 
		[ OpenControllers 
			maDetect: [ : each | each localLocation = aMagmaLocalLocation ]
			ifFound: [ : foundController | foundController ensureOpen ]
			ifNone: [ nil ] ]