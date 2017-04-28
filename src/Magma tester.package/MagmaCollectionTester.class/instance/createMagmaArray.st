test MagmaArray
createMagmaArray

	| ma |
	ma := MagmaArray new.
	1 to: 100 do: [ : n | ma at: n put: n printString ].
	clientSession commit:
		[ clientSession root
			at: 'testMagmaArray'
			put: ma ]