key-construction
dummyKey: frwdKey bits: keyBitsPlusOne 
	"Construct a dummy list node key from a hash segment key."
	^ (frwdKey bitAnd: (1 bitShift: keyBitsPlusOne-1)-1) bitReverse: keyBitsPlusOne