api
args
	"Answer an Array of the command-line arguments passed in."
	| stream |
	stream := WriteStream on: Array new.
	3
		to: 1000
		do:
			[ : n | (SmalltalkImage current getSystemAttribute: n)
				ifNil: [ ^ stream contents ]
				ifNotNilDo:
					[ : arg | stream nextPut: arg ] ]