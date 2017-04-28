overriding
prepareForScan
	queue flush.
	doneQueueing := false.
	queueingProcess := 
	[ self queueObjectsToScan.
	scanProcess progressor taskSize: queue size + scanProcess progressor unitsCompleted - 1.
	doneQueueing := true ] newProcess
		name: 'queueing for ' , self name asString ;
		priority: Processor userBackgroundPriority ;
		yourself.
	queueingProcess resume