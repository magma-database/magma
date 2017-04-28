key-construction
dummyKey32: frwdKey
	"Construct a dummy list node key from a hash segment key."

	^self bitReverse32: (frwdKey bitAnd: 16r7FFFFFFFF)