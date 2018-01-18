overriding
queueObjectsToScan
	object subobjectsDo: 
		[ : each | 
		self queue: each.
		self shouldStopScanning ifTrue: [ ^ self ] ]