class fileouts
fileOutClass: aClass

	| stream |
	stream := ReadWriteStream on: String new.
	aClass fileOutOn: stream.
	stream position: 0.
	classes
		at: aClass name
		put: stream