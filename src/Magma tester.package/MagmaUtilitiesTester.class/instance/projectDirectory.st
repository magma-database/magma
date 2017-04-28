private
projectDirectory

	^ (self projectsDirectory directoryExists: 'Magma')
		ifTrue:
			[ FileDirectory on: (self projectsDirectory fullNameFor: 'Magma') ]
		ifFalse:
			[ self projectsDirectory ]