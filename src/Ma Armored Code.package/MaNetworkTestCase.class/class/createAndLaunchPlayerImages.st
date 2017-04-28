other squeak images
createAndLaunchPlayerImages
	self playersDo: 
		[ : each | 
		self isConductorImage ifTrue: [ self createAndLaunchImageNamed: each imageFilename ] ]