key-construction
hashKey: rvrsKey bits: keyBitsPlusOne
	"Construct a hash key from a list node key (where list node keys are bitReversed).
	 This method strips off the 'regular key' bit, so you can't distinguish regular keys from dummies."
	^(rvrsKey bitReverse: keyBitsPlusOne) bitAnd: (1 bitShift: keyBitsPlusOne-1)-1