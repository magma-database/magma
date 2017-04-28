accessing
resourcesDirectory

	^ (self projectDirectory directoryExists: 'Resources')
		ifTrue:
			[ FileDirectory on: (self projectDirectory fullNameFor: 'Resources') ]
		ifFalse: [ self projectDirectory ]