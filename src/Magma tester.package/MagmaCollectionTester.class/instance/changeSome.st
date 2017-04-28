test MagmaArray
changeSome

	clientSession commit:
		[ (clientSession root at: 'testMagmaArray')
			at: 50
			put: 'Fifty' ]