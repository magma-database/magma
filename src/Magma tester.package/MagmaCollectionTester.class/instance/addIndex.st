test major functions
addIndex
	clientSession commit:
		[ (clientSession root at: 'testMajorFunctions') addIndex:
			((MaSearchStringIndex attribute: #yourself)
				keySize: 64 ;
				beAscii ;
				yourself) ]