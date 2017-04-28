system-initialization
startUp: justLaunchedFromOs
	justLaunchedFromOs ifTrue: [ Smalltalk restartSigTermHandler ]