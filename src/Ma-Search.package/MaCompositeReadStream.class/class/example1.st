examples
example1
	"self example1"
	| stream |
	stream := self streams:
		{ (1 to: 10) asArray readStream.
		'abcxyz' readStream }.
	[ stream atEnd ] whileFalse: [ Transcript show: stream next printString ].
	stream reset.
	"again."
	[ stream atEnd ] whileFalse: [ Transcript show: stream next printString ]