other squeak images
launchImageNamed: aString
	| imageName |
	imageName := FileDirectory default fullNameFor: aString, '.image'.
	MaNotification signal: 'launching ', imageName.
	(Smalltalk hasClassNamed: #OSProcess)
		ifTrue:
			[ (Smalltalk classNamed: #OSProcess) command: self executableName, ' ', imageName ]
		ifFalse:
			[ Warning signal: 'Cannot launch ', imageName, ' because OSProcess package is not loaded.  Please launch this image yourself before Proceeding.' ]