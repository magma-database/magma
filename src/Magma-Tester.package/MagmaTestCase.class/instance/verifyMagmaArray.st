test MagmaArray
verifyMagmaArray
	| ma |
	clientSession abort.
	ma := clientSession root at: 'testMagmaArray'.
	1 
		to: 100
		do: [ : n | self should: [ (ma at: n) = n printString ] ].
	clientSession begin