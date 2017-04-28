overriding
prepareForScan
	queue flush.
	doneQueueing := false.
	queueingProcess := 
	[ self queueObjectsToScan.
	scanProcess taskSize: queue size + scanProcess unitsCompleted.
	doneQueueing := true ] newProcess
		name: 'queueing for ' , self name asString ;
		priority: Processor userBackgroundPriority ;
		yourself.
	queueingProcess resume