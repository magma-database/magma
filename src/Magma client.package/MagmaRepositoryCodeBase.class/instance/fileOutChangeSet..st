change sets
fileOutChangeSet: aChangeSet

	| stream |
	stream := ReadWriteStream on: String new.
	aChangeSet fileOutOn: stream.
	stream position: 0.
	changeSets
		at: aChangeSet name
		put: stream