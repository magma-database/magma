*magma-tester
pushClass: aClass

	| stream |
	stream := ReadWriteStream on: String new.
	aClass
		fileOutOn: stream
		moveSource: false
		toFile: 0.
	^self pushCode: stream
