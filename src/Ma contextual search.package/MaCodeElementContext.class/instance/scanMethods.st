initializing
scanMethods
	self systemNavigation maAllMethodReferencesDo: 
		[ : eachMr | 
		self queue: eachMr.
		self shouldStopScanning ifTrue: [ ^ self ] ]