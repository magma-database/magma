api
args
	"Answer an Array of the command-line arguments passed in."
	| stream |
self maMarked: 'delete'.
	stream := WriteStream on: Array new.
	3
		to: 1000
		do:
			[ : n | (SmalltalkImage current getSystemAttribute: n)
				ifNil: [ ^ stream contents ]
				ifNotNil:
					[ : arg | stream nextPut: arg ] ]