setup-teardown
findATranscript
	(Smalltalk
		at: #World
		ifAbsent: [  ]) ifNotNil: [ : world | world findATranscript: nil ]