private
keyHash: key size: aSize
	^ ((key hash \\ 1064164 * 1009) \\ aSize) + 1