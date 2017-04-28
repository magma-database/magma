*magma-client
asMagmaArray
	| answer index |
	answer := MagmaArray new.
	index := 0.
	self do:
		[ : each | answer
			at: (index := index + 1)
			put: each ].
	^ answer