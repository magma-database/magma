private
initializeScanProcess
	scanProcess := (MaClientProcess doBlock: [ self scan ])
		name: 'Scanning ' , self name , '...' ;
		priority: Processor userBackgroundPriority ;
		yourself.
	scanProcess description: 'Waiting to search.'