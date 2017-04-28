accessing
projectsDirectory

	^ (FileDirectory default directoryExists: 'My projects')
		ifTrue:
			[ FileDirectory on: (FileDirectory default fullNameFor: 'My projects') ]
		ifFalse:
			[ FileDirectory default ]