test MagmaArray
createEmptyMagmaArray
	clientSession commit:
		[ clientSession root
			at: #testEmptyMagmaArray
			put: MagmaArray new ]