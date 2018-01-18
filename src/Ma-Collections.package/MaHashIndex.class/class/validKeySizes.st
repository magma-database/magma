accessing
validKeySizes
	"Record sizes must be a power of 2 so that slots in every MaHashIndexRecord will be uniformely sized."
	^ 16
		to: 4096
		by: 8