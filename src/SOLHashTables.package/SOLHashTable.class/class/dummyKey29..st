key-construction
dummyKey29: frwdKey
	"Construct a dummy list node key from a hash segment key."

	^self bitReverse29: (frwdKey bitAnd: 16rFFFFFFF)