overriding
queueObjectsToScan
	fileDirectory directoryTreeDo: 
		[ : path | 
		self queue: path last.
		self shouldStopScanning ifTrue: [ ^ self ] ]