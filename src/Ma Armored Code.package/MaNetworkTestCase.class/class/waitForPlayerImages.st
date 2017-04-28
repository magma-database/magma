other squeak images
waitForPlayerImages
	
	[ (Delay forSeconds: 1) wait.
	self playerLinks allSatisfy: [ : each | each isReady ] ] whileFalse