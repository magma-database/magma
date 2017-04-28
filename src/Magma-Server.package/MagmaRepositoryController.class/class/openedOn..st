accessing
openedOn: aMagmaLocalLocation 
	"Answer the RepositoryController already opened on aMagmaLocalLocation.  If no existing controller is already open, open a new one and answer it."
	| existingController |
	^ self controllersGuard: 
		[ (existingController := self controllerOpenedOn: aMagmaLocalLocation) 
			ifNil: [ self open: aMagmaLocalLocation ]
			ifNotNil: [ existingController ] ]