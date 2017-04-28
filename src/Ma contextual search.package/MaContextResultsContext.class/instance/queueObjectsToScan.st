overriding
queueObjectsToScan
	self do:
		[ : each |
		self queue: each.
		self shouldStopScanning ifTrue: [ ^ self ] ]