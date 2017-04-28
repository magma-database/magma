setup-teardown
findATranscript
	(Smalltalk
		at: #World
		ifAbsent: [  ]) ifNotNilDo: [ : world | world findATranscript: nil ]