initialize-release
loadFactor: loadFactor segBits: numBits keyBits: keySize
	approxLoadFactor := loadFactor.
	segBits := numBits.
	segPtrs := 1 bitShift: numBits.
	segMask := segPtrs - 1.
	keyMask := 1.
	numElements := 0.
	self initializeFrame.
	keyBits := keySize.
	"Uses the low-order 31 bits of the 32-bit Murmur2 hash, plus 1 bit for dummy/regular for a total of 32 bits.
	 Thiw works reasonably well, but is slower."
	"keyBits := 31."
	buckets := nil.