*ma-serializer-core
slotAt: index put: anInteger
	"Clone of #at:put: for speed and compatibility."
	| word |
	<primitive: 166>
	anInteger < 0
		ifTrue:[anInteger < -16r80000000 ifTrue: [self error: anInteger asString , ' out of range'].
				"word := 16r100000000 + anInteger"
				word := (anInteger + 1) negated bitInvert32]
		ifFalse:[anInteger > 16r7FFFFFFF ifTrue: [self error: anInteger asString , ' out of range'].
				word := anInteger].
	self  basicAt: index put: word.
	^anInteger