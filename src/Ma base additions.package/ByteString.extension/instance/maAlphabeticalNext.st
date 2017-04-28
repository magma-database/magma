*ma base additions
maAlphabeticalNext
	"Answer the next higher String.  This is useful in indexing systems to search for left-side matching strings."
	| nextValue stream |
	nextValue := (self asByteArray inject: 0 into: [ :sum :each | sum * 256 + each ]) + 1.
	stream := WriteStream on: ByteArray new.
	nextValue digitLength to: 1 by: -1 do:
		[ : digitIndex |
		stream nextPut: (nextValue digitAt: digitIndex) ].
	^ stream contents asString