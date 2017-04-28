key-construction
hashKey29: rvrsKey
	"Construct a hash key from a list node key (where list node keys are bitReversed).
	 This method strips off the 'regular key' bit, so you can't distinguish regular keys from dummies."

	^((self bitReverse29: rvrsKey) bitAnd: 16rFFFFFFF) as31BitSmallInt