test MagmaArray
changeAtIndex50
	| ma |
	clientSession commit: 
		[ (ma := clientSession root at: 'testMagmaArray') 
			at: 50
			put: 'Fifty (50)' ].
	self assert: (ma at: 9) = (9 raisedTo: 2)