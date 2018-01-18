scanning
refresh
	self
		stopScanning ;
		resetResults.
	self initializeScanProcess.
	self changed.
	scanProcess start