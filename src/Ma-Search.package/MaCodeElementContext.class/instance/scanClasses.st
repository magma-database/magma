initializing
scanClasses
	self systemNavigation allBehaviorsDo: 
		[ : eachClass | 
		self queue: eachClass.
		self shouldStopScanning ifTrue: [ ^ self ] ]