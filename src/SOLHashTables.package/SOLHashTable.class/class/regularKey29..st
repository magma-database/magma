key-construction
regularKey29: frwdKey
	"Construct a regular list node key from a hash segment key."

	^self bitReverse29: ((frwdKey bitOr: 16r10000000) as31BitSmallInt)