accessing
shouldContinue
	^ shouldContinue and: [ serverSocket isRunning ]