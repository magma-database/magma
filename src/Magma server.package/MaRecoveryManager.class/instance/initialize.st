initialize
initialize
	super initialize.
	groupId := 0.
	self 
		initializePreMadeRecords ;
		initializeFilesToDelete ;
		initializeSerializer